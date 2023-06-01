//
//  PostCollectionViewCell.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/24.
//

import UIKit
import SnapKit

class PostCollectionViewCell: BaseCollectionViewCell {
    // MARK: - UI Property
    
    private let postImageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    override func setLayout() {
        addSubview(postImageView)
        postImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    func configureCell(with image: UIImage) {
        postImageView.image = image
    }
}
