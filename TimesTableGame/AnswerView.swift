//
//  AnswerView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 04/06/24.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        Spacer()
        Text("Toque no bichinho que está segurando a resposta certa:")
            .font(.title3)
            .multilineTextAlignment(.center)
            .foregroundStyle(.darkGreen)
            .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        HStack {
            ForEach(0..<3) { i in
                HStack {
                    Button() {
                        
                    } label: {
                        VStack() {
                            Image(.frogSquare)
                                .resizable()
                                .scaledToFill()
                                .frame(width:60, height: 40)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Text("\(i+234)")
                                .frame(width: 60, height: 40)
                                .background(.mediumRed)
                                .foregroundStyle(.lightYellow)
                                .cornerRadius(100, corners: [.bottomLeft, .bottomRight])
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                    }
                    
                }
                
            }
        }
        Spacer()
    }
}

#Preview {
    AnswerView()
}
