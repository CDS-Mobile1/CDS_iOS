//
//  DMList.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/15.
//

import UIKit

import SnapKit

final class DMListViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    let customNaviView = UIView()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray5
        textField.font = .body
        textField.placeholder = "검색"
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
        
        let backButton = UIButton()
            backButton.setImage(ImageLiteral.NavBar.DMList.arrowBack, for: .normal)
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        let userNameLabel: UILabel = {
            let label = UILabel()
            label.font = .title1
            label.textColor = .black1
            label.text = "gosopt_cds_app1"
            return label
        }()
        
        let userNameLabelItem = UIBarButtonItem(customView: userNameLabel)
        
        let arrowButton = UIButton()
        arrowButton.setImage(ImageLiteral.NavBar.DMList.arrowBottom, for: .normal)
        
        let arrowButtonItem = UIBarButtonItem(customView: arrowButton)
        
        let videoCallButton = UIButton()
        videoCallButton.setImage(ImageLiteral.NavBar.DMList.camera, for: .normal)
        
        let videoCallButtonItem = UIBarButtonItem(customView: videoCallButton)
        
        let newMessageButton = UIButton()
        newMessageButton.setImage(ImageLiteral.NavBar.DMList.newDM, for: .normal)
        
        let newMessageButtonItem = UIBarButtonItem(customView: newMessageButton)
        
        navigationItem.leftBarButtonItems = [backButtonItem, userNameLabelItem, arrowButtonItem]
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
//        let searchImageView = UIImageView(image: ImageLiteral.NavBar.DMList.search)
//        searchImageView.frame = CGRect(x: 0, y: 0, width: 10, height: searchTextField.frame.height)

//        searchTextField.leftView = searchImageView
//        searchTextField.leftViewMode = .always
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .gray5
        searchTextField.font = .body
        searchTextField.attributedPlaceholder = NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
}
