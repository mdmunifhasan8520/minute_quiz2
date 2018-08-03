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
    var playerImage: [UIImage] = []
    var playerName = [""]
    var correctAnswerArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
      
        correctAnswerArray = UserDefaults.standard.array(forKey: "scaarr") as! [Int]
        
        for questionImageid in correctAnswerArray {
            let correctQuestion = vc.list.first { (question) -> Bool in
                return questionImageid == question.id
            }
            let correctQuestion2 = vc.list.first { (question) -> Bool in
                return questionImageid == question.id
            }
            playerImage.append((correctQuestion?.questionImage)!)
            playerName.append((correctQuestion2?.questionText)!)
        }

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.myImageView.image = playerImage[indexPath.item]
        //cell.myLabel.text = playerName[indexPath.item]
        cell.myLabel.text = playerName[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

}
