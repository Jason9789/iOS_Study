//
//  ViewController.swift
//  LoginView-Ext
//
//  Created by 전판근 on 2021/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        
        let KakaoLoginBtn = CustomButton(title: "카카오로 계속하기")
        let AppleLoginBtn = CustomButton(title: "Apple로 계속하기")
        let GoogleLoginBtn = CustomButton(title: "Google로 계속하기")
        
        stack.addArrangedSubview(KakaoLoginBtn)
        stack.addArrangedSubview(AppleLoginBtn)
        stack.addArrangedSubview(GoogleLoginBtn)
        
        self.view.addSubview(stack)
        stack.anchor(left: self.view.leftAnchor, top: self.view.topAnchor, right: self.view.rightAnchor, paddingLeft: 20, paddingTop: 200, paddingRight: 20)
        KakaoLoginBtn.anchor(height: 56)
        AppleLoginBtn.anchor(height: 56)
        GoogleLoginBtn.anchor(height: 56)

        
    }
}



