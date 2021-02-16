//
//  ViewController.swift
//  playExternalMovie
//
//  Created by 전판근 on 2021/02/16.
//

import UIKit
import AVKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://videotestserver.s3.us-east-2.amazonaws.com/KakaoTalk_20210211_150834300.mp4")
        
        playVideo(url: url!)
        
    }
    
    private func playVideo(url: NSURL) {
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

