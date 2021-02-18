//
//  ViewController.swift
//  videoUploadTest
//
//  Created by 전판근 on 2021/02/17.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    @IBAction func addAction(_ sender: Any) {
        let alert = UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        let library = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
            
        }
        
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
        
        // 비디오 불러오기
        //        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
        //            flagImageSave = false
        //
        //            picker.delegate = self
        //            picker.sourceType = .photoLibrary
        //            picker.mediaTypes = [kUTTypeMovie as String]
        //            picker.allowsEditing = false
        //
        //            present(picker, animated: true, completion: nil)
        //        } else {
        //            print("Photo album inaccessable")
        //        }
    }
    
    func openCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        } else {
            print("Camera not available")
        }
        
    }
}


extension ViewController : UIImagePickerControllerDelegate,
                           UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
        {
            imageView.image = image
            print(info)
            
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    //
    //    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    //        dismiss(animated: true, completion: nil)
    //    }
    
}
