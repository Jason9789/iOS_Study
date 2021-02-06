//
//  ViewController.swift
//  youtubePlayer
//
//  Created by 전판근 on 2021/02/06.
//

import UIKit
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {

    @IBOutlet weak var playerView: WKYTPlayerView!
    let playVarsDic = ["playsinline": 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.load(withVideoId: "iimVJFovKps", playerVars: playVarsDic)
    }
}

