//
//  UserWithStory.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/24.
//

import Foundation

struct UserWithStory {
    
    let memberID: Int
    let memberImageURL: String
    let memberName: String
    let isSpecial: Bool
    
    enum CodingKeys: String, CodingKey {
        case memberID = "memberId"
        case memberImageURL = "memberImageUrl"
        case memberName
        case isSpecial
    }
    
}

extension UserWithStory {
    
    static func dummyData() -> [UserWithStory] {
        return [
            .init(memberID: 2, memberImageURL: "test2", memberName: "test2", isSpecial: false),
            .init(memberID: 3, memberImageURL: "test3", memberName: "test3", isSpecial: true),
            .init(memberID: 4, memberImageURL: "test4", memberName: "test4", isSpecial: false),
            .init(memberID: 5, memberImageURL: "test5", memberName: "test5", isSpecial: true),
        ]
    }
    
}
