//
//  UITextfield+.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/20.
//

import UIKit

import SnapKit

extension UITextField {
    
    enum IconPosition {
        case left
        case right
    }
    
    func setIcon(_ image: UIImage, position: IconPosition, padding: CGFloat, offset: CGFloat) {
        let iconView = UIImageView(image: image)
        let iconContainerView = UIView()
        iconContainerView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.centerY.equalTo(iconContainerView)
            make.leading.equalTo(iconContainerView).offset(padding)
        }
        iconContainerView.snp.makeConstraints { make in
            make.width.equalTo(iconView.snp.width).offset(padding)
            make.height.equalTo(iconView)
        }

        switch position {
        case .left:
            leftView = iconContainerView
            leftViewMode = .always
            if offset != 0 {
                leftView?.snp.remakeConstraints { make in
                    make.width.equalTo(iconView.snp.width).offset(padding)
                    make.height.equalTo(iconView.snp.height)
                    make.leading.equalTo(self.snp.leading).offset(offset)
                    make.centerY.equalTo(self)
                }
            }
        case .right:
            rightView = iconContainerView
            rightViewMode = .always
        }
    }
    
    func setAttributedPlaceholder(of string: String, with color: UIColor) {
        let attributedText = NSAttributedString(
            string: string,
            attributes: [.foregroundColor: color]
        )
        self.attributedPlaceholder = attributedText
    }
}

