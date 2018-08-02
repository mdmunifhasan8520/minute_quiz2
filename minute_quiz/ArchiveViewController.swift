//
//  ArchiveViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ArchiveViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var vc = QuestionBank()
    var i = 0
     var playerImage: [UIImage] = []
    var playerName = ["maradona","pele","sdas","dad","asd","afa","adfdaf"]
    var correctAnswerArray: [Int] = []
    
    
    //var correctAnswerImage: []
    
   // var vc = ViewController()
    
   // var myImage: [UIImage] = []
    
    //var myimage = vc.imageArray

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // playerImage = vc.allQuestions.list[i].questionImage
        //playerImage = vc.list
        
        correctAnswerArray = UserDefaults.standard.array(forKey: "scaarr") as! [Int]
        
        for questionImageid in correctAnswerArray {
            let correctQuestion = vc.list.first { (question) -> Bool in
                return questionImageid == question.id
            }
            playerImage.append((correctQuestion?.questionImage)!)
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
       
        
        //cell.myImageView.image = playerImage[indexPath.item]
        //cell.myImageView.image = myImage[indexPath.item]
       // cell.myImageView.image = playerImage[indexPath.item]
        //cell.myImageView.image = playerImage[correctAnswerArray]
        cell.myImageView.image = playerImage[indexPath.item]
        cell.myLabel.text = playerName[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

}
