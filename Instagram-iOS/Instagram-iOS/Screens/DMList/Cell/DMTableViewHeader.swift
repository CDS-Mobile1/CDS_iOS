//
//  DMTableViewHeader.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/26.
//

import UIKit

import SnapKit

final class DMTableViewHeader: UIView {
    
    private lazy var storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        register()
        configDelegate()
        setLayout()
        setSearchTextFieldUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setting
    
    private func register() {
        storyCollectionView.register(DMCollectionViewCell.self, forCellWithReuseIdentifier: DMCollectionViewCell.identifier)
    }
    
    private func configDelegate() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    private func setLayout() {
        
        backgroundColor = .white1
        
        addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.centerX.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(35)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(16)
        }
        
        addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
            $0.height.equalTo(90)
        }
    }
    
    private func setSearchTextFieldUI() {
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .gray5
        searchTextField.font = .body
        //        searchTextField.attributedPlaceholder = NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension DMTableViewHeader: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}

//MARK: - UICollectionViewDataSource

extension DMTableViewHeader: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DMCollectionViewCell.identifier, for: indexPath) as? DMCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
