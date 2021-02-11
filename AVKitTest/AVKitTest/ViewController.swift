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
        VideoHelper.startMediaBrowser(delegate: self, sourceType: .camera)
    }
    
    @IBAction func actionMerge(_ sender: Any) {
    }
    
}


extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        switch picker.sourceType {
        case .photoLibrary:
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
            
        case .camera:
            dismiss(animated: true, completion: nil)
            
            guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
                  mediaType == (kUTTypeMovie as String),
                  let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL,
                  UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else {
                return
            }
            
            UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, #selector(video(_:didFinishSavingWithError:contextInfo:)), nil)
            
        default:
            break
        }
        
    }
    
    @objc func video(
        _ videoPath: String,
        didFinishSavingWithError error: Error?,
        contextInfo info: AnyObject
    ) {
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                            title: "OK",
            style: UIAlertAction.Style.cancel,
            handler: nil ))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}

