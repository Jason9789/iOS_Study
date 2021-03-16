//
//  ViewController.swift
//  AVPlayerLayerTest
//
//  Created by 전판근 on 2021/03/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var video: String?
    
    @IBOutlet weak var vView: UIView!
    @IBAction func pauseBtn(_ sender: Any) {
        player.pause()
    }
    @IBAction func PlayBtn(_ sender: Any) {
        player.play()
    }
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        video = Bundle.main.path(forResource: "SampleVideo1", ofType: ".mp4")
        
//        print(video?.description)
        
        let videoURL = NSURL(fileURLWithPath: video!)
        player = AVPlayer(url: videoURL as URL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize

        vView.layer.addSublayer(playerLayer)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = vView.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }


}

