//
//  ViewController.swift
//  AnimationTest
//
//  Created by 전판근 on 2021/02/01.
//

import UIKit

class ViewController: UIViewController {

    var object = UIView()
    var animationToggle = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationToggle.layer.position = CGPoint(x: 200, y: 100)
        animationToggle.addTarget(self, action: #selector(animationSwitch(sender:)), for: UIControl.Event.valueChanged)
        
        self.view.addSubview(object)
        self.view.addSubview(animationToggle)
        
        reset()
        
    }
    
    @objc func animationSwitch(sender: UISwitch) {
        sender.isOn ? start() : reset()
    }

    private func start() {
//        var frame = object.frame
//        frame.origin = CGPoint(x: 100, y: 400)
//        frame.size = CGSize(width: 200, height: 200)
//
//        UIView.animate(withDuration: 1.0, animations: {
//            self.object.frame = frame
//            self.object.alpha = 0.5
//            self.object.backgroundColor = .magenta
//        }, completion: { finished in
//            UIView.animate(withDuration: 1.0) {
//                self.reset()
//            }
//        })
        
        // Spring animate 효과
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.2,
                       options: .curveEaseInOut,
                       animations: {
                        self.object.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
                        self.object.alpha = 0.5
                        self.object.backgroundColor = .magenta
                       }, completion: nil)
    }
    
    private func reset() {
        object.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
        object.alpha = 1.0
        object.backgroundColor = UIColor.yellow
    }
}
