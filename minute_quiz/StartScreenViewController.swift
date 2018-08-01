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
    
    @IBAction func Start(_ sender: Any) {
        //print("hello world")
        //UserDefaults.standard.set(nameField.text, forKey: "name")
        
       // UserDefaults.standard.set(highestScoreLabel.text, forKey: "hscore")
        
       // UserDefaults.standard.set(forGamePlayHighestScoreLabel.text, forKey: "hscoreforGamePlay")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //forGamePlayHighestScoreLabel.text = String(0)
    
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String {
            nameField.text = name
            userName.text = nameField.text
            //print(name)
        }
        
        //permanent highest score saved section
        let highestScoreLabelObject = UserDefaults.standard.integer(forKey: "hscore")
        if let highestScore = highestScoreLabelObject as? Int {
            highestScoreLabel.text = "\(highestScore)"
            
        }
        let forGameplayhighestscoreObject = UserDefaults.standard.integer(forKey: "hscoreforGamePlay")
        if let forGameplayhighestscore = forGameplayhighestscoreObject as? Int {
            forGamePlayHighestScoreLabel.text = "\(forGameplayhighestscore)"
            
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
