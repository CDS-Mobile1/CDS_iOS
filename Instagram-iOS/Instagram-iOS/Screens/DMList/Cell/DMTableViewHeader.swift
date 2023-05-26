//
//  DMTableViewHeader.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/26.
//

import UIKit

import SnapKit

final class DMTableViewHeader: UITableViewHeaderFooterView {
    
    static let identifier = "DMTableViewHeader"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .bodyKorBold
        label.textColor = .black1
        label.text = "즐겨찾기"
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray5
        textField.font = .body
        //TODO: - 추후 placeholder 세팅 시 추가하겠습니다
        //        textField.placeholder = "검색"
        return textField
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: DMTableViewHeader.identifier)
        
        setLayout()
        setSearchTextFieldUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        
        contentView.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(35)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    private func setSearchTextFieldUI() {
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .gray5
        searchTextField.font = .body
        //        searchTextField.attributedPlaceholder = NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
}

