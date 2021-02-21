//
//  ViewController.swift
//  BasicVideoPlayer
//
//  Created by 전판근 on 2021/02/20.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    
    @IBAction func playVideo(_ sender: Any) {
        
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
                return
            }
            // Create an AVPlayer, passing it the HTTP Live Streaming URL.
            let player = AVPlayer(url: url)

            // Create a new AVPlayerViewController and pass it a reference to the player.
            let controller = AVPlayerViewController()
            controller.player = player

            // Modally present the player and call the player's play() method when complete.
            present(controller, animated: true) {
                player.play()
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

