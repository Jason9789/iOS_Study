//
//  ViewController.swift
//  RESTfulTEST
//
//  Created by 전판근 on 2021/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTime: UILabel!
    @IBAction func callCurrentTime(_ sender: Any) {
        
        do {
            // 1. URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            self.currentTime.text! = response
            self.currentTime.sizeToFit()
        } catch let e as Error {
            print(e.localizedDescription)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
}

