//
//  StartScreenViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 7/30/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var highestScoreLabel: UILabel!
    @IBOutlet weak var forGamePlayHighestScoreLabel: UILabel!
    
    @IBOutlet weak var settingsButtonLabel: UIButton!
  
    
    //create instance of UserDefaults
    let userDefaults = UserDefaults.standard
    
    
    //var collection: [Array<Any>]
    @IBAction func Start(_ sender: Any) {
    }
    
    @IBAction func Settings(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegueID", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userDefaults.set(0, forKey: "hscore")
        //userDefaults.set([], forKey: "scaarr")
        
        //for user name
        let nameObject = userDefaults.object(forKey: "name")
        if let name = nameObject as? String {
            nameField.text = name
            userName.text = nameField.text
            //print(name)
        }
        
        
        //permanent highest score saved section
        let highestScore = userDefaults.integer(forKey: "hscore")
        let forGameplayhighestscore = userDefaults.integer(forKey: "hscoreforGamePlay")
        highestScoreLabel.text = "\(highestScore)"
        forGamePlayHighestScoreLabel.text = "\(forGameplayhighestscore)"
       
         print("start:\(highestScore)")
        //collectionImage.image = userDefaults.object(forKey: "image") as? UIImage
        //let data = userDefaults.object(forKey: "savedImage") as! NSData
        //collectionImage.image = UIImage(data: data as Data)
        
    }

}
