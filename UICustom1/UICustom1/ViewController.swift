//
//  ViewController.swift
//  UICustom1
//
//  Created by 전판근 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // 버튼을 생성하고, 속성을 설정
        let btn = UIButton(type: UIButton.ButtonType.system)
        btn.frame = CGRect(x: 100, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: UIControl.State.normal)
        
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        self.view.addSubview(btn)
        
        // 버튼의 이벤트와 메소드 btnOnClick(_:)을 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }
    
    @objc func btnOnClick(_ sender: Any) {
        // 호출한 객체가 버튼이라면
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다", for: UIControl.State.normal)
        }
    }
}


