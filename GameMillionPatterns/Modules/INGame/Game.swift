//
//  Game.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    var level: Int { return gameSession?.level.value ?? 0 }
    var gameStrategy: GameStrategy = Regular()
    internal var results = [GameSession]()
    internal var questions = [Question]()
    
    internal var gameSession: GameSession?
    private let gameCaretaker = GameCaretaker()
    
    private init() {
        gameCaretaker.game = self
    }

    func startGame() {
        questions = gameStrategy.defineQuestions(questions: questions)
        gameSession = GameSession(questions: questions)
        gameCaretaker.restoreState()
    }
    
    func endGame() {
        if let session = gameSession {
            addResult(session)
        }
        gameCaretaker.clearState()
        gameSession = nil
    }
    
    func holdGame() {
        gameCaretaker.saveGame()
        gameSession = nil
    }
    
    func setQuestion(level: Int) -> Question {
        return questions[level]
    }
    
    func checkUserAnswer(buttonPressedIndex: Int) -> Bool {
        if let session = gameSession {
            return questions[session.level.value].checkAnswer(userAnswer: buttonPressedIndex)
        } else { return false }
    }
    
    func nextQuestion() {
        gameSession?.level.value += 1
    }
    
    func isLastQuestion() -> Bool {
        if let session = gameSession {
            return session.level.value + 1 >= questions.count
        } else { return false }
    }

    func addResult(_ result: GameSession) {
        results.append(result)
    }
    
    func clearResults() {
        results = []
    }
    
}


