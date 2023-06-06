//
//  DMTableViewCellHeader.swift
//  Instagram-iOS
//
//  Created by Joon Baek on 2023/05/29.
//

import UIKit

import SnapKit

final class DMTableViewCellHeader: UITableViewHeaderFooterView {
    
    // MARK: - Property
    
    static let identifier = "DMTableViewCellHeader"

    // MARK: - UI Property
    
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.font = .bodyKorBold
        label.textColor = .black1
        label.text = "메시지"
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setLayout() {
        
        addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
