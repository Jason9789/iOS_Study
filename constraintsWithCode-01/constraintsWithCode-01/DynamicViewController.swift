//
//  DynamicViewController.swift
//  constraintsWithCode-01
//
//  Created by 전판근 on 2021/03/10.
//

import UIKit

class DynamicViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func addView() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        label.text = """
            asdfasd
            asdfasdfasdf
            qwerqwfasdf
            123rqwefasdf
            qfasvzxcbasdgf
            asdfqwdfasdf
            """
        
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    @IBAction func removeView() {
        guard let last = stackView.arrangedSubviews.last else { return }
        
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(last)
        }
    }
   

}
