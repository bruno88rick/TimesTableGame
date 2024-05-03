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
        .alert("Carregar Configurações", isPresented: $setting.showingLoadingSettingsError) {
            Button("Configurar Jogo") {
                showingSettings = true
            }
        } message: {
            Text("Parece que as configurações do Jogo não foram salvas. Configure agora:")
        }
        .sheet(isPresented: $showingSettings) {
            GameSettings()
        }
    }
}

#Preview {
    ContentView()
}
