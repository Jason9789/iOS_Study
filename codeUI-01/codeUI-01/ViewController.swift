//
//  ViewController.swift
//  codeUI-01
//
//  Created by 전판근 on 2021/02/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTestSlider()
        configureTestButton()
        configureTestLabel()
    }
    
    func configureTestSlider() {
        let testSlider = UISlider()
        testSlider.translatesAutoresizingMaskIntoConstraints = false
        testSlider.maximumValue = 10
        testSlider.minimumValue = 0
        testSlider.value = 5
        
        view.addSubview(testSlider)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let leading = NSLayoutConstraint(item: testSlider, attribute: .leading, relatedBy: .equal, toItem: safeArea, attribute: .leading, multiplier: 1, constant: 50)
        
        let trailing = NSLayoutConstraint(item: testSlider, attribute: .trailing, relatedBy: .equal, toItem: safeArea, attribute: .trailing, multiplier: 1, constant: -100)
        
        let top = NSLayoutConstraint(item: testSlider, attribute: .top, relatedBy: .equal, toItem: safeArea, attribute: .top, multiplier: 1, constant: 100)
        
        NSLayoutConstraint.activate([leading, trailing, top])
    }

    func configureTestButton() {
        let testButton = UIButton()
        testButton.setTitle("클릭해주세요!", for: .normal)
        testButton.backgroundColor = .purple
        testButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(testButton)
        
        let safeArea = view.safeAreaLayoutGuide
        testButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        testButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        testButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20).isActive = true
    }
    
    
    func configureTestLabel() {
        let testLabel = UILabel()
        testLabel.text = "Text 하는 중\nmade by 팡근"
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.font = .italicSystemFont(ofSize: 17)
        testLabel.textColor = .red
        testLabel.numberOfLines = 0
        testLabel.textAlignment = .center
        
        view.addSubview(testLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        testLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true
    }
}


import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

@available(iOS 14.3.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
