//
//  AnswerView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import SwiftUI

struct AnswerView: View {
    var answer: Int
    var animalImage: Image
    var body: some View {
        VStack() {
            animalImage
                .resizable()
                .scaledToFill()
                .frame(width:60, height: 40)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            Text("\(answer)")
                .frame(width: 60, height: 40)
                .background(.mediumRed)
                .foregroundStyle(.lightYellow)
                .cornerRadius(100, corners: [.bottomLeft, .bottomRight])
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    AnswerView(answer: 1, animalImage: Image("bear_square"))
}
