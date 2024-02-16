//
//  ContentView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var setting = Setting()
    @State private var showingSettings = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .alert("Erro ao Carregar Configurações", isPresented: $setting.showingLoadingSettingsError) {
            Button("Configurar Jogo") {
                showingSettings = true
            }
        } message: {
            Text("Não foi possível carregar as configurações do jogo. Configure novamente e salve.")
        }
        .sheet(isPresented: $showingSettings) {
            GameSettings()
        }
    }
}

#Preview {
    ContentView()
}
