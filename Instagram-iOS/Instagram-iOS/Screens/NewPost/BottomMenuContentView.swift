//
//  BottomMenuContentView.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

import SnapKit

enum NewPostBottomMenuType: CaseIterable {
    case tagSomeone
    case addPlace
    case facebook
    case advancedSetting
}

final class BottomMenuContentView: UIButton {
    
    // MARK: - Property
    
    let menuType: NewPostBottomMenuType
    
    var menuIcon: UIImage {
        switch menuType {
        case .tagSomeone: return ImageLiteral.NewPost.tagSomeone
        case .addPlace: return ImageLiteral.NewPost.addPlace
        case .facebook: return ImageLiteral.NewPost.facebook
        case .advancedSetting: return ImageLiteral.NewPost.advancedSetting
        }
    }
    
    var menuIconSize: CGFloat {
        switch menuType {
        case .tagSomeone: return 30
        case .addPlace: return 26
        case .facebook: return 22
        case .advancedSetting: return 26
        }
    }
    
    var menuTitle: String {
        switch menuType {
        case .tagSomeone: return "사람 태그하기"
        case .addPlace: return "위치 추가"
        case .facebook: return "Facebook"
        case .advancedSetting: return "고급 설정"
        }
    }
    
    // MARK: - UI Property
    
    private let topSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let menuIconImageView = UIImageView()
    
    private let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black1
        label.font = .bodyKor
        return label
    }()
    
    private let rightChevron = UIImageView(image: ImageLiteral.Common.rightChevron)
    
    private lazy var facebookToggleView = UISwitch()
    
    // MARK: - Life Cycle
    
    init(menuType: NewPostBottomMenuType) {
        self.menuType = menuType
        
        super.init(frame: .zero)
        
        setLayout()
        setStyle()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        addSubview(topSeparator)
        topSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        addSubview(menuIconImageView)
        menuIconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(menuIconSize)
        }
        
        addSubview(menuTitleLabel)
        menuTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(46)
            $0.centerY.equalToSuperview()
        }
        
        if menuType == .facebook {
            addSubview(facebookToggleView)
            facebookToggleView.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        } else {
            addSubview(rightChevron)
            rightChevron.snp.makeConstraints {
                $0.trailing.equalToSuperview().inset(16)
                $0.centerY.equalToSuperview()
            }
        }
    }
    
    private func setStyle() {
        backgroundColor = .white1
        menuIconImageView.image = menuIcon
        menuTitleLabel.text = menuTitle
    }
    
}
