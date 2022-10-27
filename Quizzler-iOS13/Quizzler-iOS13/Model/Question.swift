//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Kanishk Vijaywargiya on 20/10/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Bool
    
    init(text: String, answer: Bool) {
        self.text = text
        self.answer = answer
    }
}
