//
//  GameStrategy.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import Foundation

protocol GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question]
}

class Regular: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions
    }
}

class Random: GameStrategy {
    func defineQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}

extension GameStrategy {
    static var strategyName: String {
        return String(describing: self)
    }
}
