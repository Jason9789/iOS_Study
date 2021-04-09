//
//  ViewController.swift
//  toggleButtonTest
//
//  Created by 전판근 on 2021/04/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var firstTitle: UILabel = {
        let ft = UILabel()
        ft.text = "관심 있는 악기를 선택 해주세요."
        ft.font = UIFont.boldSystemFont(ofSize: 22)
        
        return ft
    }()
    
    var secondTitle: UILabel = {
        let st = UILabel()
        st.text = "좀 더 관련있는 컨텐츠를 찾을 수 있습니다."
        st.textColor = UIColor.lightGray
        st.font = UIFont.boldSystemFont(ofSize: 14)
        
        return st
    }()
    
    var nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.backgroundColor = UIColor(red: 255/255, green: 100/255, blue: 90/255, alpha: 1)
        
        return btn
    }()
    
    let guitar = instrumentButton(title: "기타")
    let drum = instrumentButton(title: "드럼")
    let bass = instrumentButton(title: "베이스")
    let piano = instrumentButton(title: "피아노")
    let keyboard = instrumentButton(title: "키보드")
    let wind = instrumentButton(title: "관악기")
    let percussion = instrumentButton(title: "타악기")
    
//MARK:- view Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        addView()
    }
    
    private func viewInit() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "맞춤 정보 설정"
    }
    
//MARK:- add Objects
    
    private func addView() {
        self.view.addSubview(firstTitle)
        self.view.addSubview(secondTitle)
        self.view.addSubview(nextButton)
        self.view.addSubview(guitar)
        self.view.addSubview(drum)
        self.view.addSubview(bass)
        self.view.addSubview(piano)
        self.view.addSubview(keyboard)
        self.view.addSubview(wind)
        
        firstTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(161)
            make.left.equalTo(self.view).offset(20)
        }
        
        secondTitle.snp.makeConstraints { (make) in
            make.top.equalTo(firstTitle.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(20)
        }
        
        nextButton.snp.makeConstraints{ (make) in
            make.height.equalTo(56)
            make.bottom.equalTo(self.view).offset(-32)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
        }
        
        guitar.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(secondTitle.snp.bottom).offset(30)
            make.left.equalTo(self.view).offset(20)
        }
        
        drum.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(secondTitle.snp.bottom).offset(30)
            make.left.equalTo(guitar.snp.right).offset(25)
        }
        
        bass.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(secondTitle.snp.bottom).offset(30)
            make.left.equalTo(drum.snp.right).offset(25)
        }
        
        piano.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(guitar.snp.bottom).offset(30)
            make.left.equalTo(self.view).offset(20)
        }
        
        keyboard.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(drum.snp.bottom).offset(30)
            make.left.equalTo(piano.snp.right).offset(25)
        }
        
        wind.snp.makeConstraints { (make) in
            make.width.height.equalTo(104)
            make.top.equalTo(bass.snp.bottom).offset(30)
            make.left.equalTo(keyboard.snp.right).offset(25)
        }
    }
}

