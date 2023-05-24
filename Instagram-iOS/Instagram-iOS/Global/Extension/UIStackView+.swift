//
//  UIStackView+.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/20.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
