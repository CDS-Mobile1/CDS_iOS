//
//  NewPostImageCollectionViewCell.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

final class NewPostImageCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - UI Property
    
    private let contentImageView = UIImageView(image: ImageLiteral.Common.defaultImage)
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(contentImageView)
        contentImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    func configureContentImage(to image: UIImage) {
        contentImageView.image = image
    }
    
}
