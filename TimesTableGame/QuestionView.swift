//
//  QuestionView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack() {
            VStack{
                Image(.bear)
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("Ursinho Bear quer saber!")
                    .font(.title2)
                    .foregroundStyle(.darkGreen)
                    .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            Text("Qual é o resultado de")
                .font(.system(size: 24, weight: .heavy).bold())
                .foregroundStyle(.darkGreen)
                .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding()
            HStack(spacing: 3){
                Image(systemName: "1.circle")
                    .font(.system(size: 72))
                    .foregroundColor(.mediumRed)
                    .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                Image(systemName: "xmark")
                    .font(.system(size: 50))
                    .foregroundColor(.darkGreen)
                    .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
                Image(systemName: "1.circle")
                    .font(.system(size: 72))
                    .foregroundColor(.mediumRed)
                    .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding()
            }
        }
        //.background(.mediumGreen)
    }
}

#Preview {
    QuestionView()
}
