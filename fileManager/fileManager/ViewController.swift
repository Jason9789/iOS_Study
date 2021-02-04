//
//  ViewController.swift
//  fileManager
//
//  Created by 전판근 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {

    let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PanGeun")
        
        
        // 폴더 만들기
        let filePath = documentsURL.appendingPathComponent("PanGeun")
        if !fileManager.fileExists(atPath: filePath.path) {
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                NSLog("Couldn't create document directory")
            }
        }
        
        
        // 파일 만들기
        let fileURL = documentsURL.appendingPathComponent("PanGeun의 파일.txt")
        let myTextString = NSString(string: "HELLO WORLD")
        
        try? myTextString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8.rawValue)
        
        
        
        
    }
}

