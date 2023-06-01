//
//  Story.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/24.
//

import UIKit

struct Story {
    
    let storyID: Int
    let storyImageURL: String
    
    enum CodingKeys: String, CodingKey {
        case storyID = "storyId"
        case storyImageURL = "storyImageUrl"
    }
    
}

extension Story {
    
    static func dummyData() -> [[Story]] {
        return [
            [
                .init(storyID: 2, storyImageURL: "test2"),
                .init(storyID: 3, storyImageURL: "test3"),
                .init(storyID: 4, storyImageURL: "test4"),
            ],
            [
                .init(storyID: 2, storyImageURL: "test2"),
            ],
            [
                .init(storyID: 2, storyImageURL: "test2"),
                .init(storyID: 3, storyImageURL: "test3"),
            ],
            [
                .init(storyID: 2, storyImageURL: "test2"),
                .init(storyID: 3, storyImageURL: "test3"),
                .init(storyID: 4, storyImageURL: "test4"),
                .init(storyID: 4, storyImageURL: "test5"),
            ],
        ]
    }
    
}
