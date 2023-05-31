//
//  Config.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/15.
//

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseUrl = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot be found.")
        }
        return dict
    }()
    
}

extension Config {
    
    static let baseUrl: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseUrl] as? String
        else { fatalError("baseURL not found") }
        return key
    }()
    
}

