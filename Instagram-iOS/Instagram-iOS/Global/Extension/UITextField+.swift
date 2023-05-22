//
//  UITextField+.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/23.
//

import UIKit

extension UITextField {
    
    func setAttributedPlaceholder(of string: String, with color: UIColor) {
        let attributedText = NSAttributedString(
            string: string,
            attributes: [.foregroundColor: color]
        )
        self.attributedPlaceholder = attributedText
    }
}
