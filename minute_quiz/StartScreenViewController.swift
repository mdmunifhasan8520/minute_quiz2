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
    
    
    @IBAction func Start(_ sender: Any) {
        //print("hello world")
        UserDefaults.standard.set(nameField.text, forKey: "name")
        UserDefaults.standard.set(highestScoreLabel.text, forKey: "hscore")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String {
            nameField.text = name
            userName.text = nameField.text
            //print(name)
        }
        
        let highestScoreLabelObject = UserDefaults.standard.object(forKey: "hscore")
        if let highestScore = highestScoreLabelObject as? String {
            highestScoreLabel.text = highestScore
            
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
