//
//  ViewController.swift
//  dataTransferBetweenScreens
//
//  Created by 판근 on 2020/08/26.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultSwitch: UILabel!
    @IBOutlet weak var resultStepper: UILabel!
//    @IBAction func moveNext(_ sender: Any) {
//        guard let uvc = self.storyboard?.instantiateViewController(identifier: "VC2") else {
//            return
//        }
//        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//        
//        self.present(uvc, animated: true)
//    }
    
    
    var paramText: String?
    var paramUpdate: Bool?
    var paramStepper: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let text = paramText {
            resultText.text = text
        }
        if let update = paramUpdate {
            resultSwitch.text = update == true ? "자동갱신":"자동갱신안함"
        }
        if let stepper = paramStepper {
            resultStepper.text = "\(stepper) 분마다"
        }
    }

}

