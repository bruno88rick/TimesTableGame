//
//  ContentView.swift
//  TimesTableGame
//
//  Created by Bruno Oliveira on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var setting = Setting()
    
    let allAnimals = [animalsEnum.bear.rawValue, animalsEnum.buffalo.rawValue, animalsEnum.chick.rawValue, animalsEnum.chicken.rawValue, animalsEnum.cow.rawValue, animalsEnum.crocodile.rawValue, animalsEnum.dog.rawValue, animalsEnum.duck.rawValue, animalsEnum.elephant.rawValue, animalsEnum.frog.rawValue]
    
    let allAnimalsName = [animalsNameEnum.bear.rawValue, animalsNameEnum.buffalo.rawValue, animalsNameEnum.chick.rawValue, animalsNameEnum.chicken.rawValue, animalsNameEnum.cow.rawValue, animalsNameEnum.crocodile.rawValue, animalsNameEnum.dog.rawValue, animalsNameEnum.duck.rawValue, animalsNameEnum.elephant.rawValue, animalsNameEnum.frog.rawValue]
    
    @State private var showingSettings = false
    @State private var showingFinalResult = false
    @State private var gameActive = false
    
    @State private var dificultyText = 0
    @State private var timesTableOf = 0
    @State private var numberOfQuestions = 5
    @State private var question = 0
    @State private var matchNumber = 0
    @State private var correctAnswer = 0
    @State private var scoreCorrect = 0
    @State private var scoreWrong = 0
    
    @State private var questionsArray = [Int]()
    @State private var arrayAnswer = [Int]()
    
    @State var winTheGame = false
    
    var resultMessage: String {
        if winTheGame == true {
            return "Parabéns! Você foi demais. Continue Treinando!"
        } else {
            return "Certeza que você deu seu máximo, e estou muito orgulhoso! Vamos tentar novamente pra treinar mais esta tabuada?"
        }
    }
    
    var body: some View {
        
        let ramdomImageQuestion = Int.random(in: 0..<10)
        let ramdomImageStart = Int.random(in: 0..<10)
        
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
                                Image(allAnimals[ramdomImageQuestion])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                Text("\(allAnimalsName[ramdomImageQuestion]) quer aprender!")
                                    .font(.title3)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.darkGreen)
                                    .shadow(color: .lightYellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                
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
                                let ramdonElement = allAnimals.randomElement()
                                HStack {
                                    Button() {
                                        answerButtonTapped(answerTapped: indexNumber)
                                    } label: {
                                        AnswerView(answer: arrayAnswer.indices.contains(indexNumber) ? arrayAnswer[indexNumber] : 0, animalImage: Image("\(ramdonElement ?? allAnimals[indexNumber])_square"))
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
                            Image(allAnimals[ramdomImageStart])
                                .resizable()
                                .scaledToFill()
                                .frame(width:100, height: 40)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Text("Vamos Jogar? 🎮")
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
                
                ZStack {
                    Color(.darkGreen)
                        .ignoresSafeArea()
                        
                    VStack {
                        Text("\(resultMessage)")
                            .font(.system(size: 24, weight: .heavy).bold())
                            .multilineTextAlignment(.center)
                            .foregroundStyle(winTheGame ? .green : .lightGreen)
                            .padding()
                        Image(allAnimals[ramdomImageStart])
                            .resizable()
                            .scaledToFill()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .shadow(radius: 5)
                        Button {
                            reset()
                            startPlaying()
                            showingFinalResult = false
                        }label: {
                            Text("Jogar Novamente")
                                .frame(width: 180, height: 40)
                                .background(.mediumGreen)
                                .foregroundStyle(.lightYellow)
                                .cornerRadius(100, corners: [.bottomLeft, .bottomRight])
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        .padding()
                    }
                    .padding()
                }
                .hiddenConditionally(isHidden: !showingFinalResult)
            }
            .safeAreaInset(edge: .bottom) {
                ScoreView(scoreCorrect: scoreCorrect, scoreWrong: scoreWrong)
                    .shadow(radius: 10)
            }
            .background(.mediumGreen)
            .scrollBounceBehavior(.basedOnSize)
            .sheet(isPresented: $showingSettings) {
                GameSettings(setting: setting)
            }
            .toolbar() {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button() {
                        reset()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.lightYellow)
                            .shadow(radius: 3)
                            .accessibilityLabel("Resetar Game")
                    }
                    .hiddenConditionally(isHidden: !gameActive)
                    
                    Button() {
                        showingSettings = true
                        reset()
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.lightYellow)
                            .shadow(radius: 3)
                            .accessibilityLabel("Ir para Configurações do Jogo")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    HStack(alignment: .center, spacing: 1) {
                        Group {
                            Text("Dificuldade:")
                                .foregroundStyle(.lightYellow)
                            Image(systemName: "\(dificultyText).circle")
                                .foregroundColor(.lightYellow)
                                .accessibilityLabel("Dificuldade \(dificultyText)")
                        }
                        .padding(1)
                        Group {
                            Text("Tabuada:")
                                .foregroundStyle(.lightYellow)
                            Image(systemName: "\(timesTableOf).circle")
                                .foregroundStyle(.lightYellow)
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
    }
    
    func match() {
        if matchNumber <= numberOfQuestions {
            question = questionsArray.randomElement() ?? 0
            correctAnswer = question * timesTableOf
            arrayAnswer.removeAll()
            appendAnwerArray()
            matchNumber += 1
        } else {
            if scoreCorrect > scoreWrong {
                winTheGame = true
            } else {
                winTheGame = false
            }
            showingFinalResult = true
        }
    }
    
    func determineNumberOfQuestion() {
        switch dificultyText {
        case 2: numberOfQuestions = 10
        case 3: numberOfQuestions = 20
        default: numberOfQuestions = 5
        }
    }
    
    func appendQuestionArray () -> [Int] {
        var question = [Int]()
        for i in 1...numberOfQuestions {
            question.append(i)
        }
        return question.shuffled()
    }
    
    func appendAnwerArray () {
        arrayAnswer.append(correctAnswer)
        arrayAnswer.append(question * Int.random(in: 1...5))
        arrayAnswer.append(question * Int.random(in: 5...10))
        arrayAnswer.sort()
    }
    
    func reset() {
        gameActive = false
        scoreWrong = 0
        scoreCorrect = 0
        question = 0
        matchNumber = 0
        questionsArray.removeAll()
        arrayAnswer.removeAll()
    }
    
    func answerButtonTapped (answerTapped: Int) {
        if correctAnswer == arrayAnswer[answerTapped] {
            //retirar item do array de questões se já respondida corretamente
            //questionsArray.remove(at:)
            scoreCorrect += 1
            match()
        } else {
            scoreWrong += 1
            match()
        }
    }
    
}

#Preview {
    ContentView()
}
