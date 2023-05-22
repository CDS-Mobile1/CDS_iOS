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
    
    lazy var profileBorderView: UIView = {
        let view = UIView()
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
        setBorder()
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
    
    func setBorder() {
        let shape = configureCircularBorderShape(with: profileBorderRadius)
        let borderLayer = configureBorderLayer()
        borderLayer.mask = shape
        
        profileBorderView.layer.sublayers?.removeAll()
        profileBorderView.layer.insertSublayer(borderLayer, at: 0)
    }
    
    // MARK: - Action Helper
    
    private func profileImageButtonTapped() {
        guard storyStatus != .none else { return }
        storyStatus = .seen
        setBorder()
    }
    
    // MARK: - Custom Method
    
    private func configureCircularBorderShape(with radius: CGFloat) -> CAShapeLayer {
        let shape = CAShapeLayer()
        let center = CGPoint(x: profileWithBorderSize / 2, y: profileWithBorderSize / 2)
        shape.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: 0,
                                  endAngle: .pi * 2,
                                  clockwise: true).cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.black.cgColor
        shape.lineWidth = profileBorderWidth
        
        return shape
    }
    
    private func configureBorderLayer() -> CAGradientLayer {
        let borderLayer = CAGradientLayer()
        borderLayer.frame = profileBorderView.bounds
        borderLayer.startPoint = .init(x: 1, y: 0.1)
        borderLayer.endPoint = .init(x: 0, y: 0.9)
        borderLayer.locations = [0.3, 0.4, 1]
        borderLayer.colors = configureBorderLayerColors().map { $0.cgColor }
        
        return borderLayer
    }
    
    private func configureBorderLayerColors() -> [UIColor] {
        let colors: [UIColor]
        switch storyStatus {
        case .none: colors = .init(repeating: .clear, count: 3)
        case .seen: colors = .init(repeating: .gray5, count: 3)
        case .new: colors = [.Gradient.topPurple,
                             .Gradient.mediumRed,
                             .Gradient.bottomYellow]
        case .special: colors = .init(repeating: .green1, count: 3)
        }
        
        return colors
    }
    
}
