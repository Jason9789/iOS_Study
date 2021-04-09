//
//  instrumentButton.swift
//  toggleButtonTest
//
//  Created by 전판근 on 2021/04/09.
//

import UIKit

class instrumentButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setImage(UIImage(systemName: "person"), for: .normal)
        setTitleColor(.lightGray, for: .normal)
        
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
