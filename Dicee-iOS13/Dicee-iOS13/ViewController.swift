//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet allows me to reference a UI element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 1
    var rightDiceNumber = 5
    
    // viewDidLoad란?
    // 앱이 실행될 때 (화면이 Load가 되었을 때) 실행되는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        print("leftDiceNumber at beginning = \(leftDiceNumber)")
        print("rightDiceNumber at beginning = \(rightDiceNumber)")
        
        diceImageView1.image = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ][leftDiceNumber]
        diceImageView2.image = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ][rightDiceNumber]
        
        leftDiceNumber += 1
        rightDiceNumber -= 1
        
        if (leftDiceNumber == 6) {
            leftDiceNumber = 0
        }
        
        if (leftDiceNumber == 1) {
            rightDiceNumber = 5
        }
        
        print("leftDiceNumber at the end = \(leftDiceNumber)")
        print("rightDiceNumber at the end = \(rightDiceNumber)")
        
    }
    
}

