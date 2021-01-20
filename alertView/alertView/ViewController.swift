//
//  ViewController.swift
//  alertView
//
//  Created by 전판근 on 2021/01/20.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func checkButton(_ sender: Any) {
        let alertView = self.storyboard?.instantiateViewController(identifier: "alertStoryBoard")
        
        alertView?.modalTransitionStyle = .coverVertical
        alertView?.modalPresentationStyle = .overCurrentContext
        self.present(alertView!, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

