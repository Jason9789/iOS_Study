//
//  signUpViewController.swift
//  crud_firebase
//
//  Created by 전판근 on 2021/01/22.
//

import UIKit
import Firebase

class signUpViewController: ViewController {
    
    @IBOutlet weak var signUpEmailTextField: UITextField!
    @IBOutlet weak var singUpPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func signUpTouchButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
