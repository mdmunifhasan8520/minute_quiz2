//
//  ViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/29/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create a QuestioBank object
    let allQuestions = QuestionBank()
    
    //create a variable
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    //for track the score
    var homeBestScore: Int = 0
    var bestScore: Int = 0
    var score : Int = 0
    
    //for track the current and wrong answer
    var correctAnswerCount : Int = 0
    var wrongAnswerCount : Int = 0
    
    //correct answer collection
    var myCorrectAnswerCollecction = [Int]()
    var myWrongAnswerCollecction = [Int]()
    
    var storedCorrentAnswerArr = [Int]()
    var storedWrongAnswerArr = [Int]()
    
    //@IBOutlet weak var highestScoreLabel: UILabel!
    
    //for the Timer
    var startInt = 2
    var startTimer = Timer()
    
   
    
    
    //ui elements from the storyboard
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var correctAnswerCountLabel: UILabel!
    @IBOutlet weak var wrongAnswerCountLabel: UILabel!
    
    //@IBOutlet weak var ImageArray: UIImageView!
    
    //create instance of UserDefaults
    let userDefaults = UserDefaults.standard
    
    //@IBOutlet weak var ImageArray: UIImageView!
    @IBOutlet weak var ImageArrayView: UIImageView!
    @IBOutlet weak var ImageArrayView2: UIImageView!
    @IBOutlet weak var ImageArrayView3: UIImageView!
    @IBOutlet weak var ImageArrayView4: UIImageView!
    @IBOutlet weak var ImageArrayView5: UIImageView!
    @IBOutlet weak var ImageArrayView6: UIImageView!
    
    var imageArray: [UIImage] = []
    //var image: UIImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        for i in 0..<storedCorrentAnswerArr.count {
            imageArray.append(allQuestions.list[i].questionImage)
        }*/
        
        bestScore = userDefaults.integer(forKey: "hscore")
        homeBestScore = userDefaults.integer(forKey: "hscoreforGamePlay")
        storedCorrentAnswerArr = userDefaults.object(forKey: "scaarr") as? [Int] ?? [Int]()
        storedWrongAnswerArr = userDefaults.object(forKey: "swaarr") as? [Int] ?? [Int]()
        
        //print("bestScore:\(bestScore)")
        gameStart()
    }

    @IBAction func Home(_ sender: Any) {
        /*if bestScore > homeBestScore {
            bestScore = homeBestScore
        }*/
        //userDefaults.set("\(imageArray[0])", forKey: "savedImage")
    
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        //after checking the answer proceed to the next question
        questionNumber = questionNumber + 1
        nextQuestion()
        }
    
    func gameStart() {
        myCorrectAnswerCollecction.removeAll()
        myWrongAnswerCollecction.removeAll()
        allQuestions.list.sort { (a, b) -> Bool in (arc4random() % 6) > 3}
        
        //for start the timer
        timer.text = "\(startInt)"
        startTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startGameTimer), userInfo: nil, repeats: true)
        
        nextQuestion()

    }
    
    func summeryUI() {
        //for correct and wrong anser counter
        correctAnswerCountLabel.text = "\(correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(wrongAnswerCount)"
        scoreLabel.text = "Score: \(score)"
        
        //print("summary:scor\(score)")
        //print("summaryBest\(bestScore)")
        if score > bestScore {
            bestScore = score
            userDefaults.set("\(bestScore)", forKey: "hscore")
        }
        
        //for correct and wrong answer collection
        let newCorrectAnswers = myCorrectAnswerCollecction.filter { (id) -> Bool in
            return (storedCorrentAnswerArr.index(of: id) == nil) ? true : false
        }
        storedCorrentAnswerArr.append(contentsOf: newCorrectAnswers)
        userDefaults.set(storedCorrentAnswerArr, forKey: "scaarr")
        
        //print(myCorrectAnswerCollecction)
        //print(newCorrectAnswers)
        //print(storedCorrentAnswerArr)
   }
    
    func updateUI() {
        //for correct and wrong anser counter
        correctAnswerCountLabel.text = "\(correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(wrongAnswerCount)"
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 5"
        progressBar.frame.size.width = (view.frame.size.width / 5) * CGFloat(questionNumber + 1)
    }
    
    func nextQuestion() {
        if questionNumber <= 4 {
            questionImage.image = allQuestions.list[questionNumber].questionImage
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
            updateUI()
        } else {
            
            summeryUI()
            
            startTimer.invalidate()
            
            //create an AlertViewController object
            let alert = UIAlertController(title: "Awesome", message: "You have finished the quiz", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
                { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        let currentQuestion = allQuestions.list[questionNumber]
        if currentQuestion.answer == pickedAnswer {
            print("you got it")
            score = score + 1
            correctAnswerCount = correctAnswerCount + 1
            myCorrectAnswerCollecction.append(currentQuestion.id)
  
        } else {
            print("shame")
            wrongAnswerCount = wrongAnswerCount + 1
            myWrongAnswerCollecction.append(currentQuestion.id)
        }
    }
    
    func startOver() {
        wrongAnswerCount = 0
        correctAnswerCount = 0
        score = 0
        questionNumber = 0
        startInt = 30
        
        gameStart()
    }
    
    @objc func startGameTimer() {
        startInt -= 1
        timer.text = "\(startInt)"
        
        if startInt == 0 {
            startTimer.invalidate()
            summeryUI()
            let alert = UIAlertController(title: "Times Up", message: "could not answer all question", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:
            { (UIAlertAction) in
                self.startOver()
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
    }
}

