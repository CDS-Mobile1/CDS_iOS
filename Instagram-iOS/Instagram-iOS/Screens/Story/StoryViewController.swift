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
    
    let storyCount: Int = 1
    
    
    // MARK: - UI Property
    
    private let storyImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.Common.defaultImage)
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(to: 8)
        return imageView
    }()
    
//    private let progressBarView: UIProgressView = {
//        let view = UIProgressView()
//        view.backgroundColor = .gray3
//        view.progressTintColor = .gray5
//        return view
//    }()
    
//    private lazy var progressBarStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [progressBarView])
//        stackView.spacing = 4
//        return stackView
//    }()
    
    private lazy var progressBarStackView = UIStackView()
    
    private let dmTextField: UITextField = {
        let textField = UITextField()
        textField.setCornerRadius(to: 21)
        textField.setBorder(color: .gray2, andWidth: 1)
        textField.setAttributedPlaceholder(of: "메시지 보내기", with: .white1)
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 19, height: 1))
        textField.leftViewMode = .always
        textField.textColor = .white1
        textField.font = .bodyKor
        return textField
    }()
    
    private lazy var storyLikeButton: CommonButton = {
        let button = CommonButton(with: ImageLiteral.Story.Bottom.likeWhite)
        let action = UIAction { [weak self] _ in
            self?.storyLikeButtonTapped()
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var storyDMButton: CommonButton = {
        let button = CommonButton(with: ImageLiteral.Story.Bottom.dmWhite)
        let action = UIAction { [weak self] _ in
            self?.storyDMButtonTapped()
        }
        return button
    }()
    
    private lazy var bottomButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [storyLikeButton, storyDMButton])
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    init(userId: Int) {
        self.storyUserID = userId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: change transition style
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Setting
    
    override func setLayout() {
        view.addSubview(storyImageView)
        storyImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(dmTextField)
        dmTextField.snp.makeConstraints {
            $0.top.equalTo(storyImageView.snp.bottom).offset(18)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview().inset(41)
            $0.leading.equalTo(16)
        }
        
        view.addSubview(bottomButtonStackView)
        bottomButtonStackView.snp.makeConstraints {
            $0.leading.equalTo(dmTextField.snp.trailing).offset(17)
            $0.centerY.equalTo(dmTextField)
            $0.trailing.equalToSuperview().inset(15)
        }
        
    }
    
    override func setStyle() {
        view.backgroundColor = .black
    }
    
    private func setProgressBarStackView(to count: Int) {
        let progressBarView: UIProgressView = {
            let view = UIProgressView()
            view.backgroundColor = .gray3
            view.progressTintColor = .gray5
            return view
        }()
        progressBarStackView.addArrangedSubview(progressBarView)
    }
    
    // MARK: - Action Helper
    
    private func storyLikeButtonTapped() {
        // TODO: some action
    }
    
    private func storyDMButtonTapped() {
        // TODO: some action
    }
    
    // MARK: - Custom Method
    
    
    
}
