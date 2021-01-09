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
                make.width.height.equalTo(100 * view.frame.width / 320)
                make.left.equalToSuperview()
                make.top.equalTo(view.safeAreaLayoutGuide)
            }
            
            greenView.snp.makeConstraints { (make) in
                make.width.height.equalTo(100 * view.frame.width / 320)
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.equalTo(redView.snp.right).offset(10 * view.frame.width / 320)
            }
            
            blueView.snp.makeConstraints { (make) in
                make.width.height.equalTo(100 * view.frame.width / 320)
                make.top.equalTo(view.safeAreaLayoutGuide)
                make.left.equalTo(greenView.snp.right).offset(10 * view.frame.width / 320)
            }
        }
}
