//
//  RecommendTableViewCell.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/26.
//
//
//import UIKit
//
//class RecommendTableViewCell: BaseTableViewCell {
//    // MARK: - Property
//    
//    private var recommendDummyData: [UIImage] = []
//    static let cellHeight = 332
//    
//    // MARK: - UI Property
//    
//    private let recommenLabel: UILabel = {
//        let label = UILabel()
//        label.text = "회원님을 위한 추천"
//        label.font = .detail1kor
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private let allButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("모두보기", for: .normal)
//        button.setTitleColor(.blue1, for: .normal)
//        return button
//    }()
//    
//    private let recommendFlowLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = .init(width: 214, height: 278)
//        return layout
//    }()
//    
//    lazy var recommendCollectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: recommendFlowLayout)
//        collectionView.isScrollEnabled = true
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        return collectionView
//    }()
//    
//    
//    // MARK: - Life Cycle
//    
//    // MARK: - Setting
//    
//    // MARK: - Action Helper
//    
//    // MARK: - Custom Method
//    
//
//}
