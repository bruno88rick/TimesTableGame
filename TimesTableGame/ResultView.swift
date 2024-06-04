//
//  ScoreView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        VStack {
            Group {
                Text("Yesss! Você Acertou!")
                Image(.frog)
                    .resizable()
                    .scaledToFill()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .shadow(radius: 5)
            }
            .padding(10)
        }
        .padding()
    }
}

#Preview {
    ResultView()
}
