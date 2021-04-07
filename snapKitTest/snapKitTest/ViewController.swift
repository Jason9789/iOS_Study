//
//  ViewController.swift
//  snapKitTest
//
//  Created by 전판근 on 2021/04/07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let changeView = UIView()
    let fullSizeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    private func initView() {
        self.view.backgroundColor = .white
        self.makeChangeView()
        self.makeFullSizeBtn()
    }
}

// MARK:- 기능 설정

extension ViewController {
    // 뷰 설정
    private func makeChangeView() {
        self.view.addSubview(self.changeView)
        
        self.changeView.backgroundColor = .blue
        
        self.changeView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
    }
    
    // 버튼 설정
    private func makeFullSizeBtn() {
        self.view.addSubview(self.fullSizeBtn)
        
        self.setButtonStyle()
        self.fullSizeBtn.addTarget(self, action: #selector(didTappedFullSizeBtn(_ :)), for: .touchUpInside)
        
        self.fullSizeBtn.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.changeView)
            make.top.equalTo(self.changeView.snp.bottom).offset(10)
        }
    }
    
    @objc private func didTappedFullSizeBtn(_ sender: UIButton) {
        self.fullSizeBtn.isEnabled = false
        
        self.changeView.snp.remakeConstraints{ (remake) in
            remake.top.bottom.left.right.equalTo(self.view)
        }
        
        self.fullSizeBtn.snp.remakeConstraints { (remake) in
            remake.center.equalTo(self.changeView)
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    // 버튼 스타일 설정
    private func setButtonStyle() {
        self.fullSizeBtn.setTitle("Full Mode", for: .normal)
        self.fullSizeBtn.setTitleColor(.black, for: .normal)
        
        self.fullSizeBtn.setTitle("Full Mode", for: .normal)
        self.fullSizeBtn.setTitleColor(.systemGray, for: .highlighted)
        
        self.fullSizeBtn.setTitle("Completed!", for: .disabled)
        self.fullSizeBtn.setTitleColor(.white, for: .disabled)
    }
    
}

