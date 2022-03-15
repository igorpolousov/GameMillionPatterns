//
//  Questions.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [String]
    let rightAnswer: Int
    
    func checkAnswer(userAnswer: Int) -> Bool {
        return userAnswer == rightAnswer
    }
    
    func fiftyFifty() -> Question {
        var newAnswers = ["", "", "", ""]
        var oldAnswers = answerOptions
        newAnswers[rightAnswer] = answerOptions[rightAnswer]
        oldAnswers.remove(at: rightAnswer)
        let randomAnswer = oldAnswers[Int.random(in: 0..<oldAnswers.count)]
        
        for (i, _) in answerOptions.enumerated() {
            if randomAnswer == answerOptions[i] {
                newAnswers[i] = randomAnswer
            }
        }
        return Question(question: question, answerOptions: newAnswers, rightAnswer: rightAnswer)
    }
}

// Массив с вопросами
var questionsList: [Question] = [
Question(question: "Что лучше всего притягивает магнит?", answerOptions: ["Железо", "Пластмассу", "Дерево", "Плохого человека"], rightAnswer: 0),
Question(question: "Страна происхождения Scotch Whisky", answerOptions: ["Россия", "Ирладндия", "США", "Шотландия"], rightAnswer: 3),
Question(question: "Традиционный способ обращения к судье в судах США", answerOptions: ["Ваше святейшество", "Ваша честь", "Вашество", "Yo dude!"], rightAnswer: 1),
Question(question: "В каком из этих фильмов Вупи Голдберг переодевается монахиней?", answerOptions: ["Сестричка, действуй", "Привидение", "Цветы лиловые полей", "Рыцарь Камелота"], rightAnswer: 0),
Question(question: "Человек, который не является банкиром и ссужает деньги под чрезвычайно высокие проценты, известен как?", answerOptions: ["Бумажный тигр", "Зеленая змея", "Ростовщик", "Шурин"], rightAnswer: 2)
]
