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
        case .feed: return 37
        case .story: return 72
        case .dm: return 60
        }
    }
    
    var profileBorderRadius: CGFloat {
        switch usedView {
        case .feed: return 18
        case .story: return 35
        case .dm: return 29
        }
    }
    
    var profileImageSize: CGFloat {
        switch usedView {
        case .feed: return 32
        case .story: return 62.76
        case .dm: return 52
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
    
//    lazy var profileBorderView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .clear
//        view.setCornerRadius(to: profileWithBorderSize / 2)
//        return view
//    }()
    
    lazy var profileBorderView: CircularBorderView = {
        let view = CircularBorderView(radius: profileWithBorderSize / 2)
        view.frame = .init(x: 0, y: 0, width: profileWithBorderSize, height: profileWithBorderSize)
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
            $0.size.equalTo(profileWithBorderSize)
        }
        
        addSubview(profileImageButtonView)
        profileImageButtonView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(profileImageSize)
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
        case .new: setBorderGradient()
        case .special: profileBorderView.setBorder(color: .green1, andWidth: profileBorderWidth)
        }
    }
    
    func setBorderGradient() {
        let shape = CAShapeLayer()
        let radius = profileBorderRadius
        let center = CGPoint(x: profileWithBorderSize / 2, y: profileWithBorderSize / 2)
        shape.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: 0, endAngle: .pi * 2, clockwise: true).cgPath
        shape.lineWidth = profileBorderWidth
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = profileBorderView.bounds
        gradient.colors = [UIColor.Gradient.topPurple.cgColor,
                           UIColor.Gradient.mediumRed.cgColor,
                           UIColor.Gradient.bottomYellow.cgColor]
        gradient.startPoint = .init(x: 1, y: 0.1)
        gradient.endPoint = .init(x: 0, y: 0.9)
        gradient.locations = [0.3, 0.4, 1]
        
        gradient.mask = shape
        
        profileBorderView.layer.insertSublayer(gradient, at: 0)
    }
    
}
