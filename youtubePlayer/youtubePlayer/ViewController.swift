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
    let url = "https://www.youtube.com/watch?v=iimVJFovKps"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        playerView.load(withVideoId: "iimVJFovKps", playerVars: playVarsDic)
        if let id = url.youTubeId {
            playerView.load(withVideoId: id, playerVars: playVarsDic)
        }
    }
}

extension String {
    var youTubeId: String? {
        let typePattern = "(?:(?:\\.be\\/|embed\\/|v\\/|\\?v=|\\&v=|\\/videos\\/)|(?:[\\w+]+#\\w\\/\\w(?:\\/[\\w]+)?\\/\\w\\/))([\\w-_]+)"
        let regex = try? NSRegularExpression(pattern: typePattern, options: .caseInsensitive)
        return regex
            .flatMap { $0.firstMatch(in: self, range: NSMakeRange(0, self.count)) }
            .flatMap { Range($0.range(at: 1), in: self) }
            .map { String(self[$0]) }
    }
}
