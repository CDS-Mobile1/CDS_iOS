//
//  DMTableviewCell.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/26.
//

import UIKit

import SnapKit

final class DMTableviewCell: BaseTableViewCell {
    
    // MARK: - Property
    // MARK: - UI Property
    
//    let userProfileView = UserProfileView(usedView: .dm, storyStatus: .none)
    private let userProfileView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "hanyee"
        label.font = .detail2
        label.textColor = .gray2
        return label
    }()
    
    private let textMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "hanyee"
        label.font = .detail2kor
        label.textColor = .gray2
        return label
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .yellow
        return button
    }()
    
    
    // MARK: - Layout
    
    override func setLayout() {
        addSubview(userProfileView)
        userProfileView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
        }
        
        addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalTo(userProfileView.snp.trailing).offset(10)
        }
        
        addSubview(textMessageLabel)
        textMessageLabel.snp.makeConstraints {
            $0.top.equalTo(usernameLabel).offset(2)
            $0.leading.equalTo(usernameLabel)
        }
        
        addSubview(starButton)
        starButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-9)
        }
    }
    
    override func setStyle() {
        
    }
    
    // MARK: - Custom Method
    
    
}
