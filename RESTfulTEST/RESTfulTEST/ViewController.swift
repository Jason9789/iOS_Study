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
    
    
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var responseView: UITextView!
    
    @IBAction func post(_ sender: Any) {
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)" // key1=value1&key2=value2
        let paramData = param.data(using: .utf8)
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        
        // 3. URLRequest 객체 정의 후 요청 내용 담기
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메시지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 생성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            // 5-2. 응답 처리 로직
            // 1 메인 스레드에서 비동기로 처리
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // 2. JSON 결과값 추출
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    // 3 결과가 성공일 때에만 텍스트 뷰에 출력
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!)" + "\n"
                            + "응답결과 : \(result!)" + "\n"
                            + "응답시간 : \(timestamp!)" + "\n"
                                                + "요청방식 : x-www-form-urlencoded"
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            } // end if DispatchQueue.main.async()
            print("Response Data = \(String(data: data!, encoding: .utf8)!)")
        }
        
        task.resume()
    }
    
    
    //MARK: - JSON 방식으로 API 요청
    @IBAction func json(_ sender: UIButton) {
        // 1. 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = ["userId" : userId, "name" : name] // key1=value1&key2=value2
        let paramData = try! JSONSerialization.data(withJSONObject: param, options: [])
        
        // 2. URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echoJSON")
        
        // 3. URLRequest 객체 정의 후 요청 내용 담기
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // 4. HTTP 메시지 헤더 설정
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramData.count), forHTTPHeaderField: "Content-Length")
        
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 생성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occurred : \(e.localizedDescription)")
                return
            }
            print("Response Data = \(String(data: data!, encoding: .utf8)!)")
            // 5-2. 응답 처리 로직
            // 1 메인 스레드에서 비동기로 처리
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // 2. JSON 결과값 추출
                    let result = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId = jsonObject["userId"] as? String
                    let name = jsonObject["name"] as? String
                    
                    // 3 결과가 성공일 때에만 텍스트 뷰에 출력
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!)" + "\n"
                            + "응답결과 : \(result!)" + "\n"
                            + "응답시간 : \(timestamp!)" + "\n"
                                                + "요청방식 : application/json"
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            } // end if DispatchQueue.main.async()
//            print("Response Data = \(String(data: data!, encoding: .utf8)!)")
        }
        
        task.resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
    }
}

