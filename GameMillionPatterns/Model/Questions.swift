//
//  Questions.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import Foundation

// Структура вопроса
struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    // Функция проверки вопроса
    func checkAnswer(userAnswer: Int) -> Bool {
        return userAnswer == correctAnswer
    }
    
    // Функция 50/50
    func fiftyFifty() -> Question {
        var newAnswers = ["", "", "", ""]
        var oldAnswers = answers
        newAnswers[correctAnswer] = answers[correctAnswer]
        oldAnswers.remove(at: correctAnswer)
        let randomAnswer = oldAnswers[Int.random(in: 0..<oldAnswers.count)]
        
        for (i, _) in answers.enumerated() {
            if randomAnswer == answers[i] {
                newAnswers[i] = randomAnswer
            }
        }
        return Question(question: question, answers: newAnswers, correctAnswer: correctAnswer)
    }
}

// Массив с вопросами
var questions: [Question] = [
Question(question: "Что лучше всего притягивает магнит?", answers: ["Железо", "Пластмассу", "Дерево", "Плохого человека"], correctAnswer: 0),
Question(question: "Страна происхождения Scotch Whisky", answers: ["Россия", "Ирладндия", "США", "Шотландия"], correctAnswer: 3),
Question(question: "Традиционный способ обращения к судье в судах США", answers: ["Ваше святейшество", "Ваша честь", "Вашество", "Yo dude!"], correctAnswer: 1),
Question(question: "В каком из этих фильмов Вупи Голдберг переодевается монахиней?", answers: ["Сестричка, действуй", "Привидение", "Цветы лиловые полей", "Рыцарь Камелота"], correctAnswer: 0),
Question(question: "Человек, который не является банкиром и ссужает деньги под чрезвычайно высокие проценты, известен как?", answers: ["Бумажный тигр", "Зеленая змея", "Ростовщик", "Шурин"], correctAnswer: 2)
]
