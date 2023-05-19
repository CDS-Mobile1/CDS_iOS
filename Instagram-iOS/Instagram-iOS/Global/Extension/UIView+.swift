//
//  UIView+.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/18.
//

import UIKit

extension UIView {
    
    func setCornerRadius(to radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func setBorder(color: UIColor, andWidth width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func setGradientBorder(with colors: [UIColor]) {
        let gradientBorder = CAGradientLayer()
        gradientBorder.frame = .init(origin: .zero, size: self.bounds.size)
        gradientBorder.colors = colors
        
//        let shape = CAShapeLayer()
//        shape.lineWidth = 2
//        shape.path = UIBezierPath(rect: self.bounds).cgPath
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
        
//        gradientBorder.mask = shape
        self.layer.addSublayer(gradientBorder)
        
        layoutIfNeeded()
    }
    
}
