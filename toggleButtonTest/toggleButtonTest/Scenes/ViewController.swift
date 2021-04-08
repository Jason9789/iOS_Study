//
//  ViewController.swift
//  toggleButtonTest
//
//  Created by 전판근 on 2021/04/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var box: UIButton = {
        let btn = UIButton()
        btn.setTitle("버튼", for: .normal)
        btn.backgroundColor = .blue
        
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
    }
}

