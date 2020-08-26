//
//  VC2.swift
//  dataTransferBetweenScreens
//
//  Created by 판근 on 2020/08/26.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var isUpdate: UISwitch!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            self.switchLabel.text = "갱신함"
        } else {
            self.switchLabel.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.stepperLabel.text = "\(value)분 마다"
    }
    
//    @IBAction func onSubmit(_ sender: Any) {
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
//        
//        vc.paramText = self.textField.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramStepper = Int(self.stepper.value)
//        
//        self.presentingViewController?.dismiss(animated: true)
//    }
}
