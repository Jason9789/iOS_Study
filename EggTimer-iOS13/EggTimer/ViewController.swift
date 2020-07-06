//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLable: UILabel!
    
//    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    // time
    var secondRemaining = 60
    var timer = Timer()
    

    // 선택한 계란에 따라 soft, medium, hard 선택
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        // 다른 타이머가 실행될 시 이전 타이머는 중지시키고 새로운 타이머 작동
        timer.invalidate()
        
        // Soft, Medium, Hard
        let hardness = sender.currentTitle!

        // 선택된 계란에 따라서 남은 초시간 설정
        secondRemaining = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // @objc : object-c
    @objc func updateTimer() {
        if(secondRemaining > 0) {
            print("\(secondRemaining) seconds.")
            secondRemaining -= 1    // 1초씩 감소
        }
            
        // 시간이 다 되었을 시.
        else {
            timer.invalidate()
            titleLable.text = "DONE!"
            print("DONE!!")
        }
    }
    
}
