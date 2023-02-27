//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Giorgio Latour on 2/27/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answer: String
    
    init(q: String, a: String) {
        self.questionText = q
        self.answer = a
    }
}
