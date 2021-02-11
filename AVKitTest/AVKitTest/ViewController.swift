//
//  ViewController.swift
//  AVKitTest
//
//  Created by 전판근 on 2021/02/11.
//

import UIKit
import AVKit
import MobileCoreServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func actionSelectAndPlay(_ sender: Any) {
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .savedPhotosAlbum)
    }
    
    @IBAction func actionRecordAndSave(_ sender: Any) {
    }
    
    @IBAction func actionMerge(_ sender: Any) {
    }
    
}


extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        // 1
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
              mediaType == (kUTTypeMovie as String),
              let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL
        else {
            return
        }
        
        // 2
        dismiss(animated: true) {
            // 3
            let player = AVPlayer(url: url)
            let vcPlayer = AVPlayerViewController()
            vcPlayer.player = player
            self.present(vcPlayer, animated: true, completion: nil)
        }
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}

