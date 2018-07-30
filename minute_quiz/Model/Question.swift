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
    let questionImage: UIImage!
    let questionText: String
    let answer: Bool
    
    
    //initialize properties
    init(image: UIImage, text:String, correctAnswer: Bool) {
        questionImage = image
        questionText = text
        answer = correctAnswer
    }
}
