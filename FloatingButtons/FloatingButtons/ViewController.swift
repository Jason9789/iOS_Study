//
//  ViewController.swift
//  FloatingButtons
//
//  Created by 전판근 on 2021/03/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuButton = MenuButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuButton)
        
        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -20).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                             constant: -20).isActive = true
        
    }


}

