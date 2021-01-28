//
//  ViewController.swift
//  APITest
//
//  Created by 전판근 on 2021/01/28.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://swiftapi.rubypaper.co.kr:2029/practice/echo"
        let param: Parameters = [
            "userId" : "Jason9789",
            "name" : "팡근"
        ]
        
        let alamo = Alamofire.AF.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody)
        
        alamo.responseJSON() { response in
            switch response.result {
            case .success(let value):
                print("JSON=\(value)")
                
                if let jsonObject = value as? [String: Any] {
                    print("userId = \(jsonObject["userId"]!)")
                    print("name = \(jsonObject["name"]!)")
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }


}

