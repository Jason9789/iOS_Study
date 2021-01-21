//
//  ViewController.swift
//  crud_firebase
//
//  Created by 전판근 on 2021/01/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = Auth.auth().currentUser {
            emailTextField.placeholder = "이미 로그인 된 상태입니다."
            passwordTextField.placeholder = "이미 로그인 된 상태입니다."
            LoginButton.setTitle("이미 로그인 된 상태입니다.", for: .normal)
        }
    }

    @IBAction func loginTouchButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, error in
            if user != nil {
                print("Login success")
            } else {
                print("Login fail")
            }
        }
    }
    
}

