//
//  UIColor+.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/18.
//

import UIKit

extension UIColor {
    
    static let black1 = UIColor(hex: "#262626")
    
    static let gray1 = UIColor(hex: "#656565")
    static let gray2 = UIColor(hex: "#999999")
    static let gray3 = UIColor(hex: "#C4C4C4")
    static let gray4 = UIColor(hex: "#D9D9D9")
    static let gray5 = UIColor(hex: "#ECECEC")
    
    static let white1 = UIColor(hex: "#FFFFFF")
    
    static let red1 = UIColor(hex: "#FF0237")
    
    static let blue1 = UIColor(hex: "#0098FD")
    
    static let mentionBlue = UIColor(hex: "#135690")
    
    static let green1 = UIColor(hex: "#1CD14F")
    
    static let yellow1 = UIColor(hex: "#FFE600")
    
}

extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
    
}
