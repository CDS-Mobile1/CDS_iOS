//
//  UserProfileView.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

import SnapKit

final class UserProfileView: UIView {
    
    // MARK: - Property
    
    enum UsedView {
        case feed
        case story
        case dm
    }
    
    enum StoryStatus {
        case none
        case seen
        case new
        case special
    }
    
    var usedView: UsedView
    
    var storyStatus: StoryStatus
    
    var profileWithBorderSize: CGFloat {
        switch usedView {
        case .feed: return 60
        case .story: return 72
        case .dm: return 37
        }
    }
    
    var profileImageSize: CGFloat {
        switch usedView {
        case .feed: return 52
        case .story: return 64
        case .dm: return 32
        }
    }
    
    var profileBorderWidth: CGFloat {
        switch usedView {
        case .feed: return 1
        case .story: return 2
        case .dm: return 2
        }
    }
    
    // MARK: - UI Property
    
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setCornerRadius(to: profileWithBorderSize / 2)
        view.setGradient(color1: .red, color2: .blue)
        return view
    }()
    
    lazy var profileImageButtonView: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.profileImageButtonTapped()
        }
        button.setImage(ImageLiteral.Common.defaultImage, for: .normal)
        button.setCornerRadius(to: profileImageSize / 2)
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    init(usedView: UsedView, storyStatus: StoryStatus) {
        self.usedView = usedView
        self.storyStatus = storyStatus
        
        super.init(frame: .zero)
        
        setLayout()
        configureBorder(to: self.storyStatus)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(profileBorderView)
        profileBorderView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(profileWithBorderSize)
        }
        
        profileBorderView.addSubview(profileImageButtonView)
        profileImageButtonView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(profileImageSize)
        }
    }
    
    // MARK: - Action Helper
    
    private func profileImageButtonTapped() {
        configureBorder(to: .seen)
    }
    
    // MARK: - Custom Method
    
    func configureBorder(to storyStatus: StoryStatus) {
        switch storyStatus {
        case .none: profileBorderView.setBorder(color: .clear, andWidth: 0)
        case .seen: profileBorderView.setBorder(color: .gray5, andWidth: profileBorderWidth)
            // FIXME: new 상태일 때 상태 변경
        case .new: profileBorderView.setBorder(color: .green1, andWidth: profileBorderWidth)
        case .special: profileBorderView.setBorder(color: .green1, andWidth: profileBorderWidth)
        }
    }
    
}
