//
//  PostTableViewCell.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/24.
//

import UIKit
import SnapKit

class PostTableViewCell: BaseTableViewCell {
    
    // MARK: - Property
    
    private var postDummyData: [UIImage] = []
    static let cellHeight = 591
    
    // MARK: - UI Property
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Common.defaultImage, for: .normal)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "UserName"
        label.font = .detail1
        label.numberOfLines = 0
        return label
    }()
    
    private let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Post.settingMore, for: .normal)
        return button
    }()
    
    private let postFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 375, height: 375)
        return layout
    }()
    
    lazy var postCollectionView: UICollectionView = { //여기 안에서 전체적인 셀들을 다룸
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: postFlowLayout)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Post.likeBlack, for: .normal)
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Post.comment, for: .normal)
        return button
    }()
    
    private let dmButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Post.dmBlack, for: .normal)
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Post.save, for: .normal)
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "idhereomg"
        label.font = .detail1
        label.numberOfLines = 0
        return label
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 7개"
        label.font = .detail2
        label.numberOfLines = 0
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "여기는 게시글 내용이 들어가는 곳인데 이렇게 글이 길어지게 되면 2단으로 위처럼 작성되며 그를 넘어서게 길어지면 ...으로 표현됩니다 빙빙 돌아가는 회전목마처럼 "
        label.font = .detail2
        label.numberOfLines = 2
        return label
    }()
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글 4,514개 모두 보기"
        label.font = .detail2
        label.textColor = .gray1
        label.numberOfLines = 0
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "45분 전"
        label.font = .detail4
        label.textColor = .gray1
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setDelegate()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setting
    
    func setDelegate() {
        self.postCollectionView.dataSource = self
        self.postCollectionView.delegate = self
    }
    
    override func setLayout() {
        self.contentView.addSubview(self.profileButton)
        self.contentView.addSubview(self.profileNameLabel)
        self.contentView.addSubview(self.settingButton)
        self.contentView.addSubview(self.postCollectionView)
        self.contentView.addSubview(self.likeButton)
        self.contentView.addSubview(self.commentButton)
        self.contentView.addSubview(self.dmButton)
        self.contentView.addSubview(self.saveButton)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.likeLabel)
        self.contentView.addSubview(self.contentLabel)
        self.contentView.addSubview(self.commentLabel)
        self.contentView.addSubview(self.timeLabel)
        
        profileButton.snp.makeConstraints {
            $0.height.width.equalTo(32)
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(10)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalTo(profileButton.snp.trailing).offset(8)
        }
        
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        postCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.height.equalTo(SizeLiteral.Screen.width)
            $0.width.equalTo(SizeLiteral.Screen.width)
        }
        
        likeButton.snp.makeConstraints {
            $0.height.width.equalTo(24)
//            $0.top.equalToSuperview().inset(441)
            $0.top.equalTo(postCollectionView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(14)
        }
        
        commentButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(441)
            $0.top.equalTo(postCollectionView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(54)
        }
        
        dmButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(441)
            $0.top.equalTo(postCollectionView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(94)
        }
        
        saveButton.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(441)
            $0.top.equalTo(postCollectionView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(14)
        }
        
        nameLabel.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.top.equalTo(likeButton.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        likeLabel.snp.makeConstraints {
            $0.top.equalTo(likeButton.snp.bottom).offset(12)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(12)
        }
        
        contentLabel.snp.makeConstraints {
            $0.width.equalTo(345)
            $0.height.equalTo(36)
            $0.top.equalTo(likeLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
        }
        
        commentLabel.snp.makeConstraints {
            $0.height.equalTo(14)
            $0.top.equalTo(contentLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(commentLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(22)
        }
    }
    
    // MARK: - Custom Method
    
    func prepareCells(with data: [UIImage]) {
        self.postDummyData = data
    }
    
    @objc private func likeButtonTapped() {
        let button = likeButton
        
        if button.imageView?.image == ImageLiteral.Post.likeBlackFilled {
            button.setImage(ImageLiteral.Post.likeBlack, for: .normal)
        } else {
            button.setImage(ImageLiteral.Post.likeBlackFilled, for: .normal)
        }
    }
    
}


// MARK: - UICollectionView Delegate
extension PostTableViewCell: UICollectionViewDelegate {}


// MARK: - UICollectionView Datasource
extension PostTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postCollectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureCell(with: postDummyData[indexPath.row])
        return cell
    }
}
