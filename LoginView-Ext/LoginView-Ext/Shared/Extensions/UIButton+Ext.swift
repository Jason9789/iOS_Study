//
//  UIButton+Ext.swift
//  LoginView-Ext
//
//  Created by 전판근 on 2021/04/06.
//

import UIKit

// MARK: - Custom Button Gesture

extension UIButton {
    
    
    /**
     This part will let you use the system default animation for the UIButton,
     when you use the custom UIButton class.
     */

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = true
        super.touchesBegan(touches, with: event)
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesEnded(touches, with: event)
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        super.touchesCancelled(touches, with: event)
    }

}
