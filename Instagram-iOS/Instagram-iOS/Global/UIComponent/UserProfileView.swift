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
    
    var profileImageWidthHeight: CGFloat {
        switch usedView {
        case .feed: return 52
        case .story: return 62.76
        case .dm: return 32
        }
    }
    
    var profileBorderSize: CGFloat {
        switch usedView {
        case .feed: return 1
        case .story: return 2
        case .dm: return 2
        }
    }
    
    // MARK: - UI Property
    
    lazy var profileImageButtonView: UIButton = {
        let button = UIButton()
        let action = UIAction { [weak self] _ in
            self?.profileImageButtonTapped()
        }
        button.setImage(ImageLiteral.Common.defaultImage, for: .normal)
        button.setCornerRadius(to: profileImageWidthHeight / 2)
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setCornerRadius(to: (profileImageWidthHeight + 6) / 2)
        view.setBorder(color: .black1, andWidth: 2)
        return view
    }()
    
    // MARK: - Init
    
    init(usedView: UsedView, storyStatus: StoryStatus) {
        self.usedView = usedView
        self.storyStatus = storyStatus
        
        super.init(frame: .zero)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(profileBorderView)
        profileBorderView.snp.makeConstraints {
            $0.size.equalTo(profileBorderSize)
            $0.edges.equalToSuperview()
        }
        
        addSubview(profileImageButtonView)
        profileImageButtonView.snp.makeConstraints {
            $0.size.equalTo(profileImageWidthHeight)
            $0.center.equalTo(profileBorderView)
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
        case .seen: profileBorderView.setBorder(color: .gray5, andWidth: 1)
        case .new: configureGradientBorder()
        case .special: profileBorderView.setBorder(color: .green1, andWidth: 2)
        }
    }
    
    private func configureGradientBorder() {
        // FIXME: gradient border 넣기
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.profileBorderView.frame.size)
        gradient.colors = [UIColor.Gradient.topPurple, UIColor.Gradient.mediumRed, UIColor.Gradient.bottomYellow]

        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(rect: self.profileBorderView.bounds).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.profileBorderView.layer.addSublayer(gradient)
        
        
    }
    
}
