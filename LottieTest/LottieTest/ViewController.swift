//
//  ViewController.swift
//  LottieTest
//
//  Created by 전판근 on 2021/05/20.
//

import UIKit
import Lottie


class ViewController: UIViewController {

    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup() {
        animationView.frame = view.bounds
        animationView.animation = Animation.named("62443-duck")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        
        view.addSubview(animationView)
    }


}

