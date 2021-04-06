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
        
        let logo = UIView()
        logo.backgroundColor = .lightGray
        
        
        let welcomeTitle = UILabel()
        welcomeTitle.text = "환영합니다!"
        welcomeTitle.textColor = .black
        welcomeTitle.font = UIFont.boldSystemFont(ofSize: 33)
        welcomeTitle.textAlignment = .center
        
        let guideText = UILabel()
        guideText.text = "로그인 하시면 모든 서비스를\n이용하실 수 있습니다."
        guideText.textColor = .lightGray
        guideText.font = UIFont.preferredFont(forTextStyle: .body)
        guideText.textAlignment = .center
        guideText.numberOfLines = 0

        let emptyView = UIView()
        
        stack.addArrangedSubview(logo)
        stack.addArrangedSubview(welcomeTitle)
        stack.addArrangedSubview(guideText)
        stack.addArrangedSubview(emptyView)
        stack.addArrangedSubview(KakaoLoginBtn)
        stack.addArrangedSubview(AppleLoginBtn)
        stack.addArrangedSubview(GoogleLoginBtn)
        
        
        self.view.addSubview(stack)
        
        stack.anchor(left: self.view.leftAnchor, top: self.view.topAnchor, right: self.view.rightAnchor, paddingLeft: 20, paddingTop: 0, paddingRight: 20)
        logo.anchor(top: stack.topAnchor, bottom: welcomeTitle.topAnchor, paddingTop: 140, paddingBottom: 24, width: 130, height: 130)
        emptyView.anchor(height: 77)
        KakaoLoginBtn.anchor(height: 56)
        AppleLoginBtn.anchor(height: 56)
        GoogleLoginBtn.anchor(height: 56)
        

        
    }
}



