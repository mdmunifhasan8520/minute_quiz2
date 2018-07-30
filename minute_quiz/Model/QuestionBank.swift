//
//  QuestionBank.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class QuestionBank {
    
    //create an array of question object
    var list = [Question]()
    
    init() {
        //creating a quiz item and appending it to the list
        let item = Question(image: UIImage(named: "Diego Maradona_A")!, text: "Is It Madona?", correctAnswer: false)
        
        //add the Questin to the list of question
        list.append(item)
        
        list.append(Question(image: UIImage(named: "pele_A")!, text: "Here is pele...", correctAnswer: true))
        list.append(Question(image: UIImage(named: "David Beckham_A")!, text: "David Bhuiya!...", correctAnswer: false))
        list.append(Question(image: UIImage(named: "Socrates_A")!, text: "Yes Socrates", correctAnswer: true))
        list.append(Question(image: UIImage(named: "Roberto Carlos_A")!, text: "I think ronaldo?", correctAnswer: false))
        
        
        
    }
}
