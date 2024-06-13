//
//  ContentView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var setting = Setting()
    
    static let allAnimals = [animalsEnum.bear.rawValue, animalsEnum.buffalo.rawValue, animalsEnum.chick.rawValue, animalsEnum.chicken.rawValue, animalsEnum.cow.rawValue, animalsEnum.crocodile.rawValue, animalsEnum.dog.rawValue, animalsEnum.duck.rawValue, animalsEnum.elephant.rawValue, animalsEnum.frog.rawValue]
    
    @State private var animals = allAnimals.shuffled()
    
    @State private var showingSettings = false
    @State private var gameActive = false
    @State private var dificultyText = 0
    @State private var timesTableOf = 0
    @State private var numberOfQuestion = 5
    @State private var questionsArray = [Int]()
    @State private var question = 0
    @State private var correctAnswer = 0
    @State private var arrayAnswer = [Int]()
    @State private var questionAnimal = animalsNameEnum.frog
    
    
    
    var body: some View {
        NavigationStack {
            Spacer()
            ZStack {
                Image(.backgroundGame)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .center) {
                        //questionView
                            VStack {
                                Image(animals[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                Text("\(animals[0]) Quer saber!")
                                    .font(.title2)
                                
                                Text("Qual é o resultado de")
                                    .font(.system(size: 24, weight: .heavy).bold())
                                    .foregroundStyle(.darkGreen)
                                    .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    .padding()
                                HStack(spacing: 3){
                                    Image(systemName: "\(question).circle")
                                        .font(.system(size: 72))
                                        .foregroundColor(.mediumRed)
                                        .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .padding()
                                    Image(systemName: "xmark")
                                        .font(.system(size: 50))
                                        .foregroundColor(.darkGreen)
                                        .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .padding()
                                    Image(systemName: "\(timesTableOf).circle")
                                        .font(.system(size: 72))
                                        .foregroundColor(.mediumRed)
                                        .shadow(color:.lightYellow,radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                        .padding()
                                }
                            }
                        //answerView
                        Spacer()
                        Text("Toque no bichinho que está segurando a resposta certa:")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.darkGreen)
                            .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        HStack {
                            ForEach (0..<3) { indexNumber in
                                HStack {
                                    Button() {
                                        
                                    } label: {
                                        AnswerView(answer: arrayAnswer.indices.contains(indexNumber) ? arrayAnswer[indexNumber] : 0, animalImage: Image("bear_square"))
                                    }
                                }
                                
                            }
                        }
                        Spacer()
                    }
                    .frame(alignment: .centerLastTextBaseline)
                }
                ZStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .background(.thickMaterial)
                    Button() {
                        startPlaying()
                    } label: {
                        VStack() {
                            Image(.frogSquare)
                                .resizable()
                                .scaledToFill()
                                .frame(width:100, height: 40)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Text("Let`s Start Playing...")
                                .frame(width: 180, height: 40)
                                .background(.mediumRed)
                                .foregroundStyle(.lightYellow)
                                .cornerRadius(100, corners: [.bottomLeft, .bottomRight])
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                    }
                }
                .hiddenConditionally(isHidden: gameActive)
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
                                .foregroundColor(.darkGreen)
                                .accessibilityLabel("Dificuldade \(dificultyText)")
                        }
                        .padding(1)
                        Group {
                            Text("Tabuada:")
                                .foregroundStyle(.lightYellow)
                            Image(systemName: "\(timesTableOf).circle")
                                .foregroundStyle(.darkGreen)
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
            match()
        }
    }
    
    func startPlaying () {
        
        gameActive = true
        determineNumberOfQuestion()
        questionsArray = appendQuestionArray()
        match()
        print(question)

    }
    
    func match() {
        question = questionsArray.randomElement() ?? 0
        correctAnswer = question * timesTableOf
        arrayAnswer.removeAll()
        appendAnwerArray()
        print(arrayAnswer.count)
        print(arrayAnswer)
    }
    
    func determineNumberOfQuestion() {
        switch dificultyText {
        case 2: numberOfQuestion = 10
        case 3: numberOfQuestion = 20
        default: numberOfQuestion = 5
        }
    }
    
    func appendQuestionArray () -> [Int] {
        var question = [Int]()
        for i in 1...numberOfQuestion {
            question.append(i)
        }
        return question.sorted()
    }
    
    func appendAnwerArray () {
        arrayAnswer.append(correctAnswer)
        arrayAnswer.append(question * Int.random(in: 1...5))
        arrayAnswer.append(question * Int.random(in: 5...10))
        arrayAnswer.sort()
    }
    
}

#Preview {
    ContentView()
}
