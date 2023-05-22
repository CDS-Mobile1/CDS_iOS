//
//  UIFont+.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/18.
//

import UIKit

extension UIFont {
    
    static var body: UIFont { return sfProFont("Regular", ofSize: 14) }
    static var bodyKor: UIFont { return appleSDGothicNeo("Medium", ofSize: 14) }
    static var bodyKorBold: UIFont { return appleSDGothicNeo("Bold", ofSize: 14) }
    
    static var detail1: UIFont { return sfProFont("Semibold", ofSize: 12) }
    static var detail1kor: UIFont { return appleSDGothicNeo("SemiBold", ofSize: 12) }
    
    static var detail2: UIFont { return sfProFont("Medium", ofSize: 12) }
    static var detail2kor: UIFont { return appleSDGothicNeo("Medium", ofSize: 12) }
    
    static var detail3: UIFont { return sfProFont("Medium", ofSize: 11) }
    
    static var detail4: UIFont { return sfProFont("Medium", ofSize: 10) }
    
}

extension UIFont {
    
    static func sfProFont(_ weight: String, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "SFProText-" + weight, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func appleSDGothicNeo(_ weight: String, ofSize size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "AppleSDGothicNeo-" + weight, size: size) else {
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}
