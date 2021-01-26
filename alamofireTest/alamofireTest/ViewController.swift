//
//  ViewController.swift
//  alamofireTest
//
//  Created by 전판근 on 2021/01/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTest()
        postTest()
        downTest()
    }

    
    func getTest() {
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(url,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json", "Accept" : "application.json"])
            .validate(statusCode: 200..<300)
            .responseJSON { (json) in
                // 여기서 가져온 데이터를 자유롭게 활용.
                print(json)
            }
    }
    
    func postTest() {
        let url = "https://ptsv2.com/t/p53at-1611638708/post"
        var request = URLRequest(url: URL(string:url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        // POST로 보낼 정보
        let params = ["id" : "abcd", "pw" : "123456!!!!"] as Dictionary
        
        // httpBody에 paramerters 추가
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            case .failure(let error):
                print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
            }
        }
    }
    
    func downTest() {
        // 테스트 사이트에서 복사한 다운로드 주소
        let url = "http://212.183.159.230/5MB.zip"
        
        // 파일 매니저
        let fileManager = FileManager.default
        
        // 앱 경로
        let appURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        // 파일 이름 url의 맨 뒤 컴포넌트로 지정 (50MB.zip)
        let fileName: String = URL(string: url)!.lastPathComponent
        
        // 파일 경로 생성
        let fileURL = appURL.appendingPathComponent(fileName)
        
        // 파일 경로 지정 및 다운로드 옵션 설정 (이전 파일 삭제, 디렉토리 생성)
        let destination: DownloadRequest.Destination = { _, _ in
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        // 다운로드 시작
        AF.download(url, method: .get, parameters: nil, encoding: JSONEncoding.default, to: destination).downloadProgress { (progress) in
            self.progressView.progress = Float(progress.fractionCompleted)
            self.progressLabel.text = "\(Int(progress.fractionCompleted * 100))%"
        }.response { response in
            if response.error != nil {
                print("파일 다운로드 실패")
            } else {
                print("파일 다운로드 완료")
            }
        }
    }

}

