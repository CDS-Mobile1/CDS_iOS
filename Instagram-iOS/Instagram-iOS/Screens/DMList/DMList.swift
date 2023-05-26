//
//  DMList.swift
//  Instagram-iOS
//
//  Created by 백준 on 2023/05/15.
//

import UIKit

import SnapKit

final class DMListViewController: BaseViewController {
    
    // MARK: - Property
    
    ㅅ
    
    // MARK: - UI Property
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .title1
        label.textColor = .black1
        label.text = "gosopt_cds_app1"
        return label
    }()
    
    let arrowDownButton = UIButton()
    
    let videoCallButton = UIButton()
    
    let newMessageButton = UIButton()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.NavBar.DMList.arrowBack, for: .normal)
        return button
    }()
    
    let customNaviView = UIView()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray5
        textField.font = .body
        //TODO: - 추후 placeholder 세팅 시 추가하겠습니다
//        textField.placeholder = "검색"
        return textField
    }()
    
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchTextFieldUI()
        }
    
// MARK: - Setting
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        let userNameLabelItem = UIBarButtonItem(customView: userNameLabel)
        
        let arrowDownButtonItem = UIBarButtonItem(customView: arrowDownButton)
        
        let videoCallButtonItem = UIBarButtonItem(customView: videoCallButton)
        
        let newMessageButtonItem = UIBarButtonItem(customView: newMessageButton)
        
        arrowDownButton.setImage(ImageLiteral.NavBar.DMList.arrowBottom, for: .normal)
        videoCallButton.setImage(ImageLiteral.NavBar.DMList.camera, for: .normal)
        newMessageButton.setImage(ImageLiteral.NavBar.DMList.newDM, for: .normal)
        navigationItem.leftBarButtonItems = [backButtonItem, userNameLabelItem, arrowDownButtonItem]
        navigationItem.rightBarButtonItems = [videoCallButtonItem, newMessageButtonItem]
    }
    
    override func setLayout() {
        
        view.addSubview(customNaviView)
        customNaviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(customNaviView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(35)
        }
    }
        
// MARK: - Action Helper
        
// MARK: - Custom Method
        
    private func setSearchTextFieldUI() {
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .gray5
        searchTextField.font = .body
//        searchTextField.attributedPlaceholder = NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
}
