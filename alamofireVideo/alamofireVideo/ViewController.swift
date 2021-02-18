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
    
//    let url: URL = URL(string: "https://videotestserver.s3.us-east-2.amazonaws.com/47934c16-a802-48d1-a245-b2ee099e11be_hi.mp4")!
    
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
        let filePath:String? = Bundle.main.path(forResource: "video", ofType: "mp4")
        // 앱 내부의 파일명을 NSURL 형식으로 변경
        let urltest = NSURL(fileURLWithPath: filePath!)
        print(urltest)
//        playVideo(url: urltest)
        
        
        AF.upload(multipartFormData: { multipartFormData in
            
            do {
                let videoData = try Data(contentsOf: urltest as URL)
                multipartFormData.append(videoData, withName: "file", fileName: "file.mp4", mimeType: "file/mp4")
            } catch {
                debugPrint("Couldn't get Data from URL : \(urltest): \(error)")
            }
            
        }, to: "http://18.188.174.23:8080/upload").uploadProgress(queue: .main, closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON(completionHandler:  { (response) in
           
            print(response)
            
            if let err = response.error {
                print(err)
                return
            }
            print("Successfully uploaded")
            
            let json = response.data
            if (json != nil) {
                let jsonObject = json
                print(jsonObject)
            }
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    private func playVideo(url: NSURL) {
        let playercontroller = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playercontroller.player = player
        
        self.present(playercontroller, animated: true) {
            player.play()
        }
    }
}



