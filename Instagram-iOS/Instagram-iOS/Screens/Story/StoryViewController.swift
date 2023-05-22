//
//  StoryViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/23.
//

import UIKit

import SnapKit

final class StoryViewController: BaseViewController {
    
    // MARK: - Property
    
    let storyUserID: Int
    
    
    // MARK: - UI Property
    
    
    
    // MARK: - Life Cycle
    
    init(userId: Int) {
        self.storyUserID = userId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
}
