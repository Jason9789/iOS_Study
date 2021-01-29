//
//  MapAlertViewController.swift
//  Chapter03-Alert
//
//  Created by 전판근 on 2021/01/29.
//

import UIKit
import MapKit

class MapAlertViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertBtn = UIButton(type: .system)
        
        alertBtn.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        alertBtn.center.x = self.view.frame.width / 2
        alertBtn.setTitle("Map Alert", for: .normal)
        alertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(alertBtn)
        
        // 이미지 알림창 버튼 생성
        let imageBtn = UIButton(type: .system)
        
        // 이미지 알림창 버튼 속성 설정
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = self.view.frame.width / 2
        imageBtn.setTitle("Image Alert", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        self.view.addSubview(imageBtn)
    }
    
    @objc
    func mapAlert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 VC 생성 후, 알림창에 등록
        let contentVC = MapKitViewController()
        
        
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: false)
    }
    
    @objc
    func imageAlert(_ sender: Any) {
        // 경고창 객체를 생성하고, OK 버튼 추가
        let alert = UIAlertController(title: nil, message: "이번 글의 평점은 다음과 같습니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        
        // 콘텐츠 뷰 영역에 들어갈 VC를 생성 후, 알림창에 등록
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: false)
    }
}
