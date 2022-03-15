//
//  GameSession.swift
//  GameMillionPatterns
//
//  Created by Igor Polousov on 15.03.2022.
//

import Foundation

final class GameSession {
    
    var level: Observable<Int> = Observable<Int>(0)
    var score: Int { return level.value * 3 }
    
    var isFiftyFiftyActive: Bool = true
    var isHallHelpActive: Bool = true
    var isCallFriendActive: Bool = true
    
    var questins = [Question]()
    
    init(questionsList: [Question]) {
        self.questins = questionsList
    }
}
