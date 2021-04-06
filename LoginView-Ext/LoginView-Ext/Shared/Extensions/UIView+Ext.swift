//
//  UIView+Ext.swift
//  LoginView-Ext
//
//  Created by 전판근 on 2021/04/06.
//
import UIKit

// MARK: - Auto Layout

extension UIView {
    
    
    /// This is an extension function that sets up the view's anchor.
    /// - Parameters:
    ///   - left: Super view's bottom anchor
    ///   - top: Super view's top anchor
    ///   - right: Super view's right anchor
    ///   - bottom: Super view's bottom anchor
    ///   - paddingLeft: Left padding
    ///   - paddingTop: Top padding
    ///   - paddingRight: Right padding
    ///   - paddingBottom: Bottom padding
    ///   - width: Width
    ///   - height: Height
    func anchor(left: NSLayoutXAxisAnchor? = nil,
                top: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                paddingLeft: CGFloat = 0,
                paddingTop: CGFloat = 0,
                paddingRight: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    /// This is an extension function that makes the view in the center of a particular view.
    /// - Parameters:
    ///   - view: Super view
    ///   - yConstant: You can move y axis with this parameter.
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    
    /// This is an extension function that makes the view horizontally center in the center of a particular view.
    /// - Parameters:
    ///   - view: Super view
    ///   - topAnchor: Super view's top anchor
    ///   - paddingTop: Top padding
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    
    /// This is an extension function that makes the view vertically center in the center of a particular view.
    /// - Parameters:
    ///   - view: Super view
    ///   - leftAnchor: Super view's left anchor
    ///   - paddingLeft: Left padding
    ///   - constant: You can move y axis with this parameter.
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    
    /// This is an extension function that sets up the width and the height of the view.
    /// - Parameters:
    ///   - height: Height size
    ///   - width: Width size
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    
    /// This is an extension function that sets up the height of the view.
    /// - Parameter height: Height size
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    /// This is an extension function that sets up the width of the view.
    /// - Parameter height: Width size
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    
    /// This is an extension function that lets the view fills the super view.
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(left: view.leftAnchor, top: view.topAnchor,
               right: view.rightAnchor, bottom: view.bottomAnchor)
    }
}

// MARK: - Mupol Font

//extension UIView {
//
//
//    /// This is an extension function that changes its view's font with the proper color.
//    /// - Parameter font: Font
//    func font(_ font: Font) {
//        if let v = self as? UIButton {
//            v.titleLabel?.font = .font(font)
//            v.setTitleColor(font.color, for: .normal)
//        } else if let v = self as? UILabel {
//            v.font = .font(font)
//            v.textColor = font.color
//        } else if let v = self as? UITextField {
//            v.font = .font(font)
//            v.textColor = font.color
//        } else if let v = self as? UITextView {
//            v.font = .font(font)
//            v.textColor = font.color
//        } else {
//            for v in subviews {
//                v.font(font)
//            }
//        }
//    }
//
//}
