//
//  ViewController.swift
//  UICustom1
//
//  Created by 전판근 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {

    // 멤버변수 subject를 선언
    var subject: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // 버튼을 생성하고, 속성을 설정
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 100, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: UIControl.State.normal)
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        self.view.addSubview(btn)
        
        // 레이블 객체를 추가하고 영역을 정의
        self.subject = UILabel()
        self.subject.frame = CGRect(x: 200, y: 150, width: 100, height: 30)
        self.subject.center = CGPoint(x: self.view.frame.size.width / 2, y: 200)
        self.view.addSubview(subject)
        
        
        // 버튼의 이벤트와 메소드 btnOnClick(_:)을 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }
    
    @objc func btnOnClick(_ sender: Any) {
        // 호출한 객체가 버튼이라면
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다", for: UIControl.State.normal)
        }
    }
    
    @objc func sayHello(_ sender: Any) {
        self.subject.text = "GoodBye~!, IB!"
    }
}


