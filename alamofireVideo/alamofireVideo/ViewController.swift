//
//  ViewController.swift
//  alamofireVideo
//
//  Created by 전판근 on 2021/02/18.
//

import UIKit
import Alamofire
import AVKit

class ViewController: UIViewController {
    
    let url: URL = URL(string: "https://multiplatform-f.akamaihd.net/i/multi/will/bunny/big_buck_bunny_,640x360_400,640x360_700,640x360_1000,950x540_1500,.f4v.csmil/master.m3u8")!
    
    @IBAction func playBtn(_ sender: Any) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
        
        
        // 비디오 파일명을 사용하여 비디오가 저장된 앱 내부의 파일 경로를 받아옴
        let filePath:String? = Bundle.main.path(forResource: "video", ofType: "mov")
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let url = NSURL(fileURLWithPath: filePath!)

        
        AF.upload(multipartFormData: {
            multipartFormData in
            multipartFormData.append(url as URL, withName: "file", fileName: "file.mp4", mimeType: "file/mp4")
        }, to: "http://18.188.174.23:8080/upload").response { response in

            print(response.result)
//            print("Success : \(response.result)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}



