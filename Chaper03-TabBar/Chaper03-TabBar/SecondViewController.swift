//
//  SecondViewController.swift
//  Chaper03-TabBar
//
//  Created by 전판근 on 2021/01/05.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        title.text = "두 번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 13)
        title.sizeToFit()   // 콘텐츠의 내용에 맞게 레이블 크기 변경
        title.center.x = self.view.frame.width / 2
        
        self.view.addSubview(title)
    }
}
