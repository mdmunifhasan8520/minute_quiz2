//
//  SettingsViewController.swift
//  minute_quiz
//
//  Created by MacBook Pro on 8/3/18.
//  Copyright © 2018 Code Drizzlers. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBAction func RESET(_ sender: Any) {
        UserDefaults.standard.setValue(0, forKey: "scaarr")
        UserDefaults.standard.setValue(0, forKey: "hscoreforGamePlay")
        //print(correctAnswerArray)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
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
