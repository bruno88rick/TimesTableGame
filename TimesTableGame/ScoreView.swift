//
//  ScoreView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import SwiftUI

struct ScoreView: View {
    var scoreCorrect: Int
    var scoreWrong: Int
    var body: some View {
        HStack() {
            Text("Pontuação: ")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(.lightYellow)
                .padding()
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(.lightGreen)
                .padding()
            Text("\(scoreCorrect)")
                .font(.system(size: 20))
                .bold()
                .foregroundStyle(.lightGreen)
                .padding()
            Image(systemName: "xmark.seal.fill")
                .font(.system(size: 21))
                .bold()
                .foregroundStyle(.mediumRed)
                .padding()
            Text("\(scoreWrong)")
                .font(.system(size: 21))
                .bold()
                .foregroundStyle(.mediumRed)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
        .background(.darkGreen)
    }
}

#Preview {
    ScoreView(scoreCorrect: 0, scoreWrong: 0)
}
