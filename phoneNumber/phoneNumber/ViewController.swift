//
//  ViewController.swift
//  phoneNumber
//
//  Created by 판근 on 2020/09/13.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBAction func inputButton(_ sender: UIButton) {
        print(phoneTextField.text)
        let str = phoneTextField?.text
        
        var temp = ""
        
        if str.count < 4 {
            temp = temp + str?.substring(with: Range(0, 3))
        }
        
    }
}

