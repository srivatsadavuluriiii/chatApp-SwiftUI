
import SwiftUI

struct MessageField: View {
	@EnvironmentObject var messagesManager: MessagesManager
	@State private var message = ""
	@State private var realtimeDBMessages: [Message] = []

	var body: some View {
		VStack {
			// Display messages from Realtime Database
//			ForEach(realtimeDBMessages) { message in
//				Text(message.text)
//					.foregroundColor(.black) // Adjust styling as needed
//			}

			HStack {
				// Custom text field created below
				CustomTextField(placeholder: Text("Enter your message here >>> "), text: $message, commit: sendMessage)
					.foregroundColor(.white)
					.frame(height: 40)
					.disableAutocorrection(true)

				Button {
					sendMessage()
				} label: {
					Image(systemName: "paperplane.fill")
						.foregroundColor(.white)
						.padding(10)
						.background(Color("Grayish"))
						.cornerRadius(50)
				}
			}
			.padding(.horizontal)
			.padding(.vertical, 10)
			.background(Color("Grayish"))
			.cornerRadius(20)
			.padding()
		}
		.onAppear {
			FirebaseManager.shared.getMessagesFromRealtimeDB { messages in
				self.realtimeDBMessages = messages
			}
		}
	}

	func sendMessage() {
		// Send message to Firestore
		messagesManager.sendMessage(text: message)

		// Send the same message to Realtime Database
		FirebaseManager.shared.sendMessageToRealtimeDB(
			message: Message(
				id: "\(UUID())",
				text: message,
				received: false,
				timestamp: Date()
			)
		)

		message = ""
	}
}

struct CustomTextField: View {
	var placeholder: Text
	@Binding var text: String
	var commit: () -> Void

	var body: some View {
		ZStack(alignment: .leading) {
			// If text is empty, show the placeholder on top of the TextField
			if text.isEmpty {
				placeholder
					.opacity(0.3)
			}
			TextField("", text: $text, onCommit: {
				if !text.isEmpty {
					commit()
				}
			})
		}
	}
}




#Preview{
	MessageField()
		.environmentObject(MessagesManager())
}
