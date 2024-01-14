import Foundation
import Firebase

struct FirebaseManager {
	static let shared = FirebaseManager()
	private let database = Database.database(url: "https://chatapp-build2-default-rtdb.firebaseio.com/").reference()

	func sendMessageToRealtimeDB(message: Message) {
		print("Sending message to Realtime Database")
		let messageRef = database.child("messages").childByAutoId()
		messageRef.setValue(message.toDictionary())
	}

	func getMessagesFromRealtimeDB(completion: @escaping ([Message]) -> Void) {
		database.child("messages").observeSingleEvent(of: .value) { snapshot in
			guard let data = snapshot.value as? [String: Any] else {
				completion([])
				return
			}

			let messages = data.compactMap { (key, value) -> Message? in
				guard let messageData = value as? [String: Any] else {
					return nil
				}

				return Message(
					id: key,
					text: messageData["text"] as? String ?? "",
					received: messageData["isReceived"] as? Bool ?? false,
					timestamp: messageData["timestamp"] as? Date ?? Date()
				)
			}

			completion(messages)
		}
	}
}

