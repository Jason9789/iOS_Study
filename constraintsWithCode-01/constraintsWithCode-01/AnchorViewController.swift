//
//  AnchorViewController.swift
//  constraintsWithCode-01
//
//  Created by 전판근 on 2021/03/07.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
        
        let safeBottomAncor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        
        safeBottomAncor.isActive = true
        safeBottomAncor.priority = .init(999)
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        
        viewBottomAnchor.isActive = true
    }


}
