//
//  CommonButton.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/23.
//

import UIKit

final class CommonButton: UIButton {
    
    // MARK: - Life Cycle
    
    init(with image: UIImage) {
        super.init(frame: .init(x: 0, y: 0, width: 24, height: 24))
        
        self.setImage(image, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
