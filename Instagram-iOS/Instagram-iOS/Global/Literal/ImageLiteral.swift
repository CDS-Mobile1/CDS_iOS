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
            static let camera = UIImage.load(name: "camera")
            static let newDM = UIImage.load(name: "newDM")
        }
        
        static let back = UIImage.load(name: "back")
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
    
    enum NewPost {
        static let tagSomeone = UIImage.load(name: "tagSomeone")
        static let addPlace = UIImage.load(name: "addPlace")
        static let facebook = UIImage.load(name: "facebook")
        static let advancedSetting = UIImage.load(name: "advancedSetting")
        static let addCell = UIImage.load(name: "addCell")
    }
    
    enum Common {
        static let defaultImage = UIImage.load(name: "defaultImage")
        static let rightChevron = UIImage.load(name: "rightChevron")
    }
    
    enum Post {
        static let settingMore = UIImage.load(name: "settingMore")
        
        static let likeBlack = UIImage.load(name: "likeBlack")
        static let comment = UIImage.load(name: "comment")
        static let dmBlack = UIImage.load(name: "dmBlack")
        static let save = UIImage.load(name: "save")
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
