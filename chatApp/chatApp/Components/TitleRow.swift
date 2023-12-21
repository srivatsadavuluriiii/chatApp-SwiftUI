//
//  TitleRow.swift
//  chatApp
//
//  Created by thrxmbxne on 21/12/23.
//

import SwiftUI


struct TitleRow: View {
  var imageName = "imageHA"
  var name = "Harsh Agrawal"

  var body: some View {
    HStack(spacing: 20) {
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 50, height: 50)
        .cornerRadius(50)

      VStack(alignment: .leading) {
        Text(name)
          .font(.title).bold()

        Text("Online")
          .font(.caption)
          .foregroundColor(.green)
      }
      .frame(maxWidth: .infinity, alignment: .leading)

      Image(systemName: "phone.fill")
        .foregroundColor(.gray)
        .padding(10)
        .background(.white)
        .cornerRadius(50)
    }
    .padding()
  }
}

#Preview {
  TitleRow()
   .background(Color("Grayish"))
}
