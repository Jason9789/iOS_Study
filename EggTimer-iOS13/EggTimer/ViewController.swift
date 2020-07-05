//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    // 선택한 계란에 따라 soft, medium, hard 선택
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle
        
        switch hardness {
            case "Soft":
                print(softTime)
            case "Medium":
                print(mediumTime)
            case "Hard":
                print(hardTime)
            default:
                print("Error")
        }
    }
    
}
