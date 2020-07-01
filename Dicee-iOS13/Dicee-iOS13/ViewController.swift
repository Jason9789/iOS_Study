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
    
    // viewDidLoad란?
    // 앱이 실행될 때 (화면이 Load가 되었을 때) 실행되는 함수.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WHO         WHAT    VALUE
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        
        // Who.What = Value
        // alpha : 이미지의 투명도를 나타내는 값.
        // diceImageView1.alpha = 0.5
    }


}

