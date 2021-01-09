//
//  ViewController.swift
//  AutoLayout01
//
//  Created by 전판근 on 2021/01/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let redView: UIView = {
        let redView = UIView()
        
        redView.backgroundColor = .red
        return redView
    }()
    
    private let greenView: UIView = {
        let greenView = UIView()
        
        greenView.backgroundColor = .green
        return greenView
    }()
    
    private let blueView: UIView = {
        let blueView = UIView()
        
        blueView.backgroundColor = .blue
        return blueView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
        
        redView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.left.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        greenView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(redView.snp.right).offset(10)
        }
        
        blueView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(greenView.snp.right).offset(10)
        }
    }
}
//
//class ViewController: UIViewController {
//
//    let nameLabel = UILabel()
//    let nameTextField = UITextField()
//    let changeButton = UIButton()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.white
//        self.view.addSubview(nameLabel)
//        self.view.addSubview(nameTextField)
//        self.view.addSubview(changeButton)
//
//        self.nameLabel.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(80)
//            $0.leading.equalToSuperview().offset(24)
//            $0.trailing.equalToSuperview().offset(-24)
//        }
//        self.nameTextField.snp.makeConstraints{
//            $0.top.equalTo(self.nameLabel.snp.bottom).offset(24)
//            $0.leading.equalTo(self.nameLabel)
//            $0.trailing.equalTo(self.nameLabel)
//        }
//        self.changeButton.snp.makeConstraints {
//            $0.center.equalToSuperview()
//        }
//    }
//}

