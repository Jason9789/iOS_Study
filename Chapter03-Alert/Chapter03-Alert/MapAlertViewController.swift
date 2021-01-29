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
}
