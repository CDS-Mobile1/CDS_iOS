//
//  ImageLiteral.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/18.
//

import UIKit

enum ImageLiteral {
    
    enum NavBar {
        enum MainFeed {
            static let instagramLogo = UIImage.load(name: "instagramLogo")
            
            static let likeBlack = UIImage.load(name: "likeBlack")
            static let dmBlack = UIImage.load(name: "dmBlack")
        }
        
        enum DMList {
            static let arrowBack = UIImage.load(name: "ArrowBack")
            static let arrowBottom = UIImage.load(name: "ArrowBottom")
            static let camera = UIImage.load(name: "camera")
            static let newDM = UIImage.load(name: "newdm")
            static let search = UIImage.load(name: "searchDm")
        }
    }
    
    enum TabBar {
        static let home = UIImage.load(name: "home")
        static let homeFilled = UIImage.load(name: "homeFilled")
        
        static let search = UIImage.load(name: "search")
        static let searchFilled = UIImage.load(name: "searchFilled")
        
        static let newPost = UIImage.load(name: "newPost")
        static let newPostFilled = UIImage.load(name: "newPostFilled")
        
        static let reels = UIImage.load(name: "reels")
        static let reelsFilled = UIImage.load(name: "reelsFilled")
        
        static let profile = UIImage.load(name: "profile")
    }
    
    enum Story {
        enum Top {
            static let tagged = UIImage.load(name: "tagged")
        }
        
        enum Bottom {
            static let likeWhite = UIImage.load(name: "likeWhite")
            static let likeWhiteFilled = UIImage.load(name: "likeWhiteFilled")
            
            static let dmWhite = UIImage.load(name: "dmWhite")
        }
    }
    
    enum Common {
        static let defaultProfile = UIImage.load(name: "defaultProfile")
    }
    
}

extension UIImage {
    
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name) else {
            print("Image load failed: \(name)")
            return UIImage()
        }
        return image
    }
    
}
