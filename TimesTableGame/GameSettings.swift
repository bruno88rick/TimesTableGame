//
//  GameSettings.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct GameSettings: View {
    @State private var timesTable = 1
    @State private var dificultyLevel = 1
    var setting = Setting()
    
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                Form() {
                    Section("Configurações da Tabuada"){
                        Text("Escolha a tabuada para jogar:")
                            .font(.title3)
                        Stepper("Quero a Tabuada de \(timesTable)", value: $timesTable, in: 2...12)
                    }
                    
                    Section("Configurações de Dificuldade") {
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
            }
            .navigationTitle("Configurações do Jogo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar", systemImage: "") {
                        setting.settingsItems.timesTableOf = timesTable
                        setting.settingsItems.dificultyLevel = dificultyLevel
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar", systemImage: "") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .onAppear() {
                dificultyLevel = setting.settingsItems.dificultyLevel
                timesTable = setting.settingsItems.timesTableOf
            }
        }
    }
}

#Preview {
    GameSettings()
}
