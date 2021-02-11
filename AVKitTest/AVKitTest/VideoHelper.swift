//
//  VideoHelper.swift
//  AVKitTest
//
//  Created by 전판근 on 2021/02/11.
//

import MobileCoreServices
import UIKit

enum VideoHelper {
    static func startMediaBrowser (
        delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate, sourceType: UIImagePickerController.SourceType
    ) {
        guard UIImagePickerController.isSourceTypeAvailable(sourceType) else {
            return
        }
        
        let mediaUI = UIImagePickerController()
        mediaUI.sourceType = sourceType
        mediaUI.mediaTypes = [kUTTypeMovie as String]
//        mediaUI.mediaTypes = [kUITypeMovie as String]
        mediaUI.allowsEditing = true
        mediaUI.delegate = delegate
        delegate.present(mediaUI, animated: true, completion: nil)
    }
}
