//
//  StoryCollectionViewCell.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/23.
//

import UIKit
import SnapKit

class StoryCollectionViewCell: BaseCollectionViewCell {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
    private let colorView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        return view
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    override func setLayout() {
        addSubview(colorView)
        colorView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Custom Method
    
    func configureCell(with color: UIColor) {
        colorView.backgroundColor = color
    }
    

}
