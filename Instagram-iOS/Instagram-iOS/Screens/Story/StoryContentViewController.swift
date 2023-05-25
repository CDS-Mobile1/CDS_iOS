//
//  StoryViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/23.
//

import UIKit

import SnapKit

// FIXME: delegate pattern 을 쓸 수는 없을까 ?
// 만약 쓴다면, StoryPageViewController 에서 page data 설정할 때
// 모든 VC 마다 delegate 를 설정해줘야 하는데, 이게 괜찮을까?

final class StoryContentViewController: BaseViewController {
    
    // MARK: - Property
    
    let storyUserID: Int
    
    let storyCount: Int
    
    var storyIndex: Int = 0 {
        didSet {
            configureCurrentUserStory()
        }
    }
    
    // MARK: - UI Property
    
    private lazy var storyImageView: UIImageView = {
        let imageView = UIImageView(image: ImageLiteral.Common.rightChevron)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(storyTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        imageView.setCornerRadius(to: 8)
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    private lazy var progressBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private let userProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Common.defaultImage, for: .normal)
        button.setCornerRadius(to: 16)
        return button
    }()
    
    private let userNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "some user name"
        label.font = .detail2
        label.textColor = .white1
        return label
    }()
    
    private let timePastLabel: UILabel = {
        let label = UILabel()
        label.text = "7분"
        label.font = .detail3
        label.textColor = .white1
        return label
    }()
    
    private let taggedUsersButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Story.Top.tagged, for: .normal)
        return button
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Story.Top.setting, for: .normal)
        return button
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [taggedUsersButton, settingButton])
        stackView.spacing = 3
        return stackView
    }()
    
    private let dmTextField: UITextField = {
        let textField = UITextField()
        let paddingView = UIView(frame: .init(x: 0, y: 0, width: 19, height: 1))
        textField.setCornerRadius(to: 21)
        textField.setBorder(color: .gray2, andWidth: 1)
        textField.setAttributedPlaceholder(of: "메시지 보내기", with: .white1)
        textField.leftView = paddingView
        textField.rightView = paddingView
        textField.leftViewMode = .always
        textField.rightViewMode = .always
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
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    init(userId: Int, storyCount: Int) {
        self.storyUserID = userId
        self.storyCount = storyCount
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        setProgressBarStackView(to: storyCount)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: change transition style
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        configureProgressBars()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if storyIndex == storyCount {
            storyIndex = 0
        } else if storyIndex < 0 {
            storyIndex = 0
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        initProgressBars()
    }
    
    // MARK: - Setting
    
    override func setLayout() {
        view.addSubview(storyImageView)
        storyImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        view.addSubview(progressBarStackView)
        progressBarStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.height.equalTo(2)
        }
        
        view.addSubview(userProfileButton)
        userProfileButton.snp.makeConstraints {
            $0.top.equalTo(progressBarStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(10)
            $0.size.equalTo(32)
        }
        
        view.addSubview(userNickNameLabel)
        userNickNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(userProfileButton)
            $0.leading.equalTo(userProfileButton.snp.trailing).offset(12)
        }
        
        view.addSubview(timePastLabel)
        timePastLabel.snp.makeConstraints {
            $0.centerY.equalTo(userNickNameLabel)
            $0.leading.equalTo(userNickNameLabel.snp.trailing).offset(4)
        }
        
        view.addSubview(topButtonStackView)
        topButtonStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalTo(userProfileButton)
        }
        
        view.addSubview(dmTextField)
        dmTextField.snp.makeConstraints {
            $0.top.equalTo(storyImageView.snp.bottom).offset(18)
            $0.height.equalTo(42)
            $0.bottom.equalToSuperview().inset(41)
            $0.leading.equalToSuperview().inset(16)
        }
        
        view.addSubview(bottomButtonStackView)
        bottomButtonStackView.snp.makeConstraints {
            $0.leading.equalTo(dmTextField.snp.trailing).offset(17)
            $0.centerY.equalTo(dmTextField)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    override func setStyle() {
//        view.backgroundColor = .black
    }
    
    private func setProgressBarStackView(to count: Int) {
        for _ in 0..<count {
            let progressBarView = UIProgressView()
            progressBarView.trackTintColor = .gray3
            progressBarView.progressTintColor = .gray5
            progressBarView.setCornerRadius(to: 1)
            progressBarStackView.addArrangedSubview(progressBarView)
        }
    }
    
    // MARK: - Action Helper
    
    @objc
    private func storyTapped(_ sender: UITapGestureRecognizer) {
        let touchPos = sender.location(ofTouch: 0, in: view)
        if touchPos.x < SizeLiteral.Screen.width / 3 {
            storyIndex -= storyIndex >= 0 ? 1 : 0
            print("storyTappedLeft", storyCount, storyIndex)
        } else {
            storyIndex += storyIndex <= storyCount ? 1 : 0
            print("storyTappedRight", storyCount, storyIndex)
        }
    }
    
    private func taggedUsersButtonTapped() {
        fetchTaggedUsersList()
        // TODO: 하프모달 띄우기
    }
    
    private func storyLikeButtonTapped() {
        // TODO: some action
    }
    
    private func storyDMButtonTapped() {
        // TODO: some action
    }
    
    // MARK: - Custom Method
    
    func initProgressBars() {
        progressBarStackView.arrangedSubviews.forEach { bar in
            guard let progressBar = bar as? UIProgressView
            else { return }
            progressBar.setProgress(0, animated: false)
        }
    }
    
    private func configureCurrentUserStory() {
        guard let parent = self.parent as? StoryPageViewController
        else { return }
        if storyIndex >= 0, storyIndex < storyCount {
            configureProgressBars()
            // TODO: 스토리 이미지 변경
        } else if storyIndex >= storyCount {
            parent.moveToNextUserStory()
        } else if storyIndex < 0 {
            parent.moveToPreviousUserStory()
        }
    }
    
    private func configureProgressBars() {
        guard let progressBars = progressBarStackView.arrangedSubviews as? [UIProgressView]
        else { return }
        print("configureProgressBars", storyCount, storyIndex)
        if storyIndex < storyCount {
            for i in 0...storyIndex {
                progressBars[i].setProgress(1, animated: false)
            }
        }
        if storyIndex < storyCount - 1 {
            progressBars[storyIndex + 1].setProgress(0, animated: false)
        }
    }
    
    // MARK: - API
    
    private func fetchTaggedUsersList() {
        // TODO: 태그되어 있는 유저 리스트 받아오기
    }
    
}
