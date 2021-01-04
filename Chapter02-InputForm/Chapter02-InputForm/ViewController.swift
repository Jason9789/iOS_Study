//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 전판근 on 2021/01/04.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField!    // 이메일 입력 필드
    var paramUpdate: UISwitch!      // 스위치 객체
    var paramInterval: UIStepper!   // 스테퍼
    var txtUpdate: UILabel!         // 스위치 컨트롤의 값을 표현할 레이블
    var txtInterval: UILabel!       // 스테퍼 컨트롤의 값을 표현할 레이블
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 네이게이션 바 타이틀을 입력
        self.navigationItem.title = "설정"
        
        // 2. 이메일 레이블을 생성하고 영역과 기본 문구를 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        // 3. 레이블의 폰트를 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        // 4. 루트뷰에 추가
        self.view.addSubview(lblEmail)
        
        // 자동갱신 레이블
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        // 갱신주기 레이블
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        // 이메일 입력을 위한 텍스트 필드
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextField.BorderStyle.roundedRect
        self.paramEmail.placeholder = "이메일 예) sqlpro@naver.com"
        self.paramEmail.autocapitalizationType = .none  // 대문자 자동 변환 기능 해제
        self.view.addSubview(paramEmail)
        
        // 스위치 객체를 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true)
        self.view.addSubview(paramUpdate)
        
        // 갱신주기를 위한 스테퍼 추가
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0     // 스테퍼가 가질 수 있는 최소값
        self.paramInterval.maximumValue = 100   // 스테퍼가 가질 수 있는 최대값
        self.paramInterval.stepValue = 1        // 스테퍼의 갑 변경 단위
        self.paramInterval.value = 0            // 초기값 설정
        self.view.addSubview(paramInterval)
        
        // 스위치 객체의 값을 표현할 레이블
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함"
        self.view.addSubview(txtUpdate)
        
        // 스테퍼의 값을 텍스트로 표현할 레이블을 추가
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
    }
    
    
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper) {
        self.txtInterval.text = ("\( Int(sender.value) )분마다")
    }
}


