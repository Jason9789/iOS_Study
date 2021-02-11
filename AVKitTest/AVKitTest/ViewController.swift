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
    
}

extension ViewController: UINavigationControllerDelegate {
    
}

