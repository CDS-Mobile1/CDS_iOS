//
//  CollectionViewAddCellButton.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

final class CollectionViewAddCellButton: UICollectionReusableView {
    
    // MARK: - Property
    
    static let identifier = "CollectionViewAddCellButton"
    
    // MARK: - UI Property
    
    private let addCellButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.NewPost.addCell, for: .normal)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setLayout() {
        addSubview(addCellButton)
        addCellButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
}
