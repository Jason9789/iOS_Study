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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        addView()
    }
    
    private func viewInit() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "맞춤 정보 설정"
    }
    
    private func addView() {
        self.view.addSubview(firstTitle)
        self.view.addSubview(secondTitle)
        
        firstTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(161)
            make.left.equalTo(self.view).offset(20)
        }
        
        secondTitle.snp.makeConstraints { (make) in
            make.top.equalTo(firstTitle.snp.bottom).offset(10)
            make.left.equalTo(self.view).offset(20)
        }
    }
}

