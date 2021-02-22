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
    
    var video1: String?
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        video1 = Bundle.main.path(forResource: "SampleVideo", ofType: ".mp4")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguePlayerController" {
            let videoURL = NSURL(fileURLWithPath: video1!)
            player = AVPlayer(url: videoURL as URL)
            
            let destination = segue.destination as! AVPlayerViewController
            destination.player = player
        }
    }


}

