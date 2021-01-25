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
        self.title = "CRUD"
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
            let tabSB = self.storyboard?.instantiateViewController(identifier: "tabbarSB")
            tabSB?.modalPresentationStyle = .fullScreen
            self.present(tabSB!, animated: true, completion: nil)
        }
    }
    
    @IBAction func singUpTouchButton(_ sender: Any) {
        let signUp = self.storyboard?.instantiateViewController(identifier: "signUpSB")
        signUp?.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(signUp!, animated: true)
//        self.present(signUp!, animated: true, completion: nil)
    }
}

