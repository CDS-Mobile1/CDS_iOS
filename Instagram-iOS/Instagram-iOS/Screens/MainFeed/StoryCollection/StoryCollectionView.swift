//
//  StoryCollectionView.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/23.
//

import Foundation
import UIKit
import SnapKit

final class StoryCollectionView: UIView {
    
    // MARK: - Property
    
    private let dummyData: [UIColor] = [
        .systemGray,
        .systemGray2,
        .systemGray3,
        .systemGray4,
        .systemGray5,
    ]
    
    private enum Size {
        static let cellWidth = 71
        static let cellHeight = 93
    }
    
    // MARK: - UI Property
    
    private lazy var storyCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Size.cellWidth, height: Size.cellHeight)
        layout.minimumLineSpacing = 16
        return layout
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDelegate()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    private func setDelegate() {
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
    
    private func setLayout() {
        addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(0)
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(12)
        }
    }

}


// MARK: - UICollectionView Delegate

extension StoryCollectionView: UICollectionViewDelegate {
    
}


// MARK: - UICollectionView Datasource

extension StoryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(with: dummyData[indexPath.row])
        return cell
    }
    
}
