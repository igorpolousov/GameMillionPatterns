//
//  QuestionBuilder.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//
import Foundation

class QuestionsBuilder {
    private(set) var question: String = ""
    private(set) var answerOptions: [String] = [String]()
    private(set) var rightAnswer: Int = 0
    
    func build() -> Question {
        let mixedQuestions = answerOptions.shuffled()
        for (index, answer) in mixedQuestions.enumerated() {
            if answer == answerOptions[rightAnswer] {
                rightAnswer = index
            }
        }
        return Question(question: question, answerOptions: mixedQuestions, rightAnswer: rightAnswer)
    }
    
    func setQuestion(_ question: String) -> Self {
        self.question = question
        return self
    }

    func addAnswers(_ answers: [String]) -> Self {
        answerOptions = answers
        return self
    }
    
    func setRightAnswer(_ index: Int) -> Self {
        rightAnswer = index
        return self
    }
}
