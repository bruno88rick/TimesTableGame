//
//  ContentView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var setting = Setting()
    @State var showingSettings = false
    @State var dificultyText = 0
    @State var timesTableOf = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Nível de Dificuldade: \(setting.settingsItems.dificultyLevel) para tabuada de \(setting.settingsItems.timesTableOf)")
            }
            .padding()
            .alert("Carregar Configurações", isPresented: $setting.showingLoadingSettingsError) {
                Button("Configurar Jogo") {
                    showingSettings = true
                }
            } message: {
                Text("Parece que as configurações do Jogo não foram salvas. Configure agora:")
            }
            .sheet(isPresented: $showingSettings) {
                GameSettings(setting: setting)
            }
            .toolbar() {
                Button("Settings", systemImage: "gear") {
                    showingSettings = true
                }
            }
            .onAppear() {
                dificultyText = setting.settingsItems.dificultyLevel
                timesTableOf = setting.settingsItems.timesTableOf
            }
        }
    }
}

#Preview {
    ContentView()
}
