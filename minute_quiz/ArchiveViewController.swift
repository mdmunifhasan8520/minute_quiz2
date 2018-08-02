//
//  ArchiveViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class ArchiveViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    var vc = ViewController()
    
     let playerImage: [UIImage] = [UIImage(named:"Socrates.png")!]
    var playerName = ["maradona"]
    
   // var vc = ViewController()
    
   // var myImage: [UIImage] = []
    
    //var myimage = vc.imageArray

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //myImage = vc.allQuestions.list[playerName].questionImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.myLabel.text = playerName[indexPath.item]
        //cell.myImageView.image = playerImage[indexPath.item]
        //cell.myImageView.image =
        //print(myi)
        //cell.myImageView.image = myImage[indexPath.item]
        cell.myImageView.image = playerImage[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

}
