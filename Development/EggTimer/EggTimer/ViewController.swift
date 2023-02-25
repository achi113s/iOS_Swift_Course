//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes: [String: Int] = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        switch hardness {
            case "Soft":
                print(eggTimes["Soft"]!)
            case "Medium":
                print(eggTimes["Medium"]!)
            case "Hard":
                print(eggTimes["Hard"]!)
            default:
                print("Error")
        }
    }
    
}
