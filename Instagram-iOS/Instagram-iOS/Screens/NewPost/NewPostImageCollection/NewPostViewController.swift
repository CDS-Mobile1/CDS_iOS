//
//  NewPostViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

import SnapKit

final class NewPostViewController: BaseViewController {
    
    // MARK: - Property
    
    let postContentPlaceholder = "문구 입력..."
    
    var postImageData: [UIImage] = [ImageLiteral.Common.defaultImage,
                                    ImageLiteral.Common.defaultImage,
                                    ImageLiteral.Common.defaultImage]
    
    // MARK: - UI Property
    
    private lazy var postImageCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: postImageCollectionViewFlowLayout)
        collectionView.register(NewPostImageCollectionViewCell.self, forCellWithReuseIdentifier: NewPostImageCollectionViewCell.identifier)
        collectionView.register(CollectionViewAddCellButton.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewAddCellButton.identifier)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 0)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white1
        return collectionView
    }()
    
    private let postImageCollectionViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = .init(width: 70, height: 70)
        layout.footerReferenceSize = .init(width: 68, height: 40)
        return layout
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("공유", for: .normal)
        button.setTitleColor(.blue1, for: .normal)
        button.titleLabel?.font = .bodyKorBold
        return button
    }()
    
    private let navigationBarTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새 게시물"
        label.font = .bodyKorBold
        label.textColor = .black1
        return label
    }()
    
    private lazy var postContentTextView: UITextView = {
        let textView = UITextView()
        textView.text = postContentPlaceholder
        textView.textColor = .gray2
        textView.font = .bodyKor
        textView.textContainerInset = .init(top: 8, left: 16, bottom: 20, right: 16)
        return textView
    }()
    
    private let bottomMenus = NewPostBottomMenuType.allCases.map { BottomMenuContentView(menuType: $0) }
    
    private lazy var bottomMenuStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: bottomMenus)
        stackView.axis = .vertical
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        setGesture()
    }
    
    // MARK: - Setting
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButton = BackButton(frame: .init(x: 0, y: 0, width: 24, height: 24))
        let popAction = UIAction { [weak self] _ in self?.popViewController() }
        backButton.addAction(popAction, for: .touchUpInside)
        
        let shareAction = UIAction { [weak self] _ in self?.shareButtonTapped() }
        shareButton.addAction(shareAction, for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = makeNavigationBarButton(with: backButton)
        self.navigationItem.rightBarButtonItem = makeNavigationBarButton(with: shareButton)
        self.navigationItem.titleView = navigationBarTitleLabel
    }
    
    override func setDelegate() {
        postImageCollectionView.delegate = self
        postImageCollectionView.dataSource = self
        
        postContentTextView.delegate = self
    }
    
    override func setLayout() {
        view.addSubview(postImageCollectionView)
        postImageCollectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(102)
        }
        
        view.addSubview(postContentTextView)
        postContentTextView.snp.makeConstraints {
            $0.top.equalTo(postImageCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(255)
        }
        
        view.addSubview(bottomMenuStackView)
        bottomMenuStackView.snp.makeConstraints {
            $0.top.equalTo(postContentTextView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setGesture() {
        let dragAndDropGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleDragAndDropGesture(_:)))
        postImageCollectionView.addGestureRecognizer(dragAndDropGesture)
    }
    
    // MARK: - Action Helper
    
    @objc func handleDragAndDropGesture(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let targetIndexPath = postImageCollectionView.indexPathForItem(at: gesture.location(in: postImageCollectionView))
            else { return }
            postImageCollectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            postImageCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: postImageCollectionView))
        case .ended:
            postImageCollectionView.endInteractiveMovement()
        default:
            postImageCollectionView.cancelInteractiveMovement()
        }
    }
    
    private func shareButtonTapped() {
        // TODO: API 연결 후 POST 하는 과정 추가
    }
    
}


// MARK: - UICollectionViewDelegate extension

extension NewPostViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewAddCellButton.identifier, for: indexPath) as? CollectionViewAddCellButton
        else { return UICollectionReusableView() }
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
    
}


// MARK: - UICollectionViewDataSource extension

extension NewPostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewPostImageCollectionViewCell.identifier, for: indexPath) as? NewPostImageCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configureContentImage(to: postImageData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = postImageData.remove(at: sourceIndexPath.row)
        postImageData.insert(item, at: destinationIndexPath.row)
    }
    
}


// MARK: - UITextViewDelegate extension

extension NewPostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == postContentPlaceholder {
            textView.text = nil
            textView.textColor = .black1
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = postContentPlaceholder
            textView.textColor = .gray2
        }
    }
    
}
