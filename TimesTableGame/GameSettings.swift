//
//  GameSettings.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct GameSettings: View {
    @State private var timesTable = 2
    @State private var dificultyLevel = 1
    
    var settings = Setting()
    
    var body: some View {
        NavigationStack {
            VStack() {
                
                Text("✖️ Table")
                    .font(.system(size: 48))
            
                VStack(alignment: .center, spacing: 20) {
                    
                    Form {
                        Section{
                            Text("Escolha a tabuada para jogar:")
                                .font(.title3)
                            
                            Stepper("Quero a Tabuada de \(timesTable)", value: $timesTable, in: 2...12)
                        }
                        
                        Section {
                            Text("Escolha o nível de dificuldade:")
                                .font(.title3)
                            
                            Stepper("Dificuldade Nível \(dificultyLevel)", value: $dificultyLevel, in: 1...3)
                            
                            switch dificultyLevel {
                            case 1:
                                Text("*Jogo com 5 Perguntas")
                                    .font(.caption)
                                    .foregroundStyle(.red)
                            case 2:
                                Text("*Jogo com 10 Perguntas")
                                    .font(.caption)
                                    .foregroundStyle(.red)
                            case 3:
                                Text("*Jogo com 20 Perguntas")
                                    .font(.caption)
                                    .foregroundStyle(.red)
                            default:
                                Text("*Escolha o nível de dificultade!")
                                    .font(.caption)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    
                    Button("Começar Jogo") {
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Configurações")
        }
    }
}

#Preview {
    GameSettings()
}
