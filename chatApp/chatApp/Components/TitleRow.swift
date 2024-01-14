//
//  TitleRow.swift
//  chatApp
//
//  Created by thrxmbxne on 21/12/23.
//


import SwiftUI
struct TitleRow : View{
	var imageName = "imageHA"
	var name: String = "Harsh Agrawal"
	var backgroundColor: Color = Color("Grayish").opacity(0.3)
	var body: some View {
		ZStack{
			backgroundColor
				.frame(height: 80)
			HStack{
				Image(imageName)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 50,height: 50)
					.cornerRadius(50)
				Text(name)
					.font(.title)
					.foregroundColor(.white)
					.padding()
					.offset(CGSize(width: 10.0, height: 2))
				Image(systemName: "phone.fill")
					.foregroundColor(.gray)
					.padding()
					.cornerRadius(20)
					.offset(CGSize(width: 20, height: 2))
			}
		}
	}
}

#Preview {
	TitleRow()
