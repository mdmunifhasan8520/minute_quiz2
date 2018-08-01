//
//  Question.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class Question {
    //create properties
    let id: Int
    let questionImage: UIImage!
    let questionText: String
    let answer: Bool
    
    
    //initialize properties
    init(id: Int, image: UIImage, text:String, correctAnswer: Bool) {
        self.id = id
        questionImage = image
        questionText = text
        answer = correctAnswer
    }
}
