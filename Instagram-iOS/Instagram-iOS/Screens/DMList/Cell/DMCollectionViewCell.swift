//
//  DMCollectionViewCell.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/26.
//

import UIKit

import SnapKit

final class DMCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Property
    // MARK: - UI Property
    
    let userProfileView = UserProfileView(usedView: .dm, storyStatus: .none)
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "hanyee"
        label.font = .detail4
        label.textColor = .gray2
        return label
    }()
    
    
    // MARK: - Layout
    
    override func setLayout() {
        addSubview(userProfileView)
        userProfileView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(7)
            $0.width.height.equalTo(58)
            $0.centerX.equalToSuperview()
        }
        
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints {
            $0.top.equalTo(userProfileView.snp.bottom).offset(10)
            $0.centerX.equalTo(userProfileView)
        }
    }
    
    override func setStyle() {
        
    }
    
    // MARK: - Custom Method
    
    
}
