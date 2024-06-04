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
            ScrollView {
                VStack(alignment: .center) {
                    QuestionView()
                    AnswerView()
                }
                .frame(alignment: .centerLastTextBaseline)
            }
            .safeAreaInset(edge: .bottom) {
                ScoreView()
                    .shadow(radius: 10)
            }
            .background(.mediumGreen)
            .scrollBounceBehavior(.basedOnSize)
            .sheet(isPresented: $showingSettings) {
                GameSettings(setting: setting)
            }
            //.edgesIgnoringSafeArea(.le)
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    Button() {
                        showingSettings = true
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.lightYellow)
                            .shadow(radius: 3)
                            .accessibilityLabel("Ir para Configurações do Jogo")
                    }
                }
                ToolbarItem(placement: .topBarLeading){
                    HStack(alignment: .center, spacing: 1) {
                        Group {
                            Text("Dificuldade:")
                                .foregroundStyle(.lightYellow)
                            Image(systemName: "\(dificultyText).circle")
                                .foregroundColor(.lightGreen)
                                .accessibilityLabel("Dificuldade \(dificultyText)")
                        }
                        .padding(1)
                        Group {
                            Text("Tabuada:")
                                .foregroundStyle(.lightYellow)
                            Image(systemName: "\(timesTableOf).circle")
                                .foregroundStyle(.lightGreen)
                                .accessibilityLabel("Tabuada de \(timesTableOf)")
                        }
                    }
                }
            }
        }
        .onAppear() {
            dificultyText = setting.settingsItems.dificultyLevel
            timesTableOf = setting.settingsItems.timesTableOf
            showingSettings = setting.showingLoadingSettingsError
        }
    }
    
}

#Preview {
    ContentView()
}
