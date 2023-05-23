//
//  MainFeedViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/20.
//

import UIKit
import SnapKit

class MainFeedViewController: BaseViewController {
   
    // MARK: - UI Property
    
    private let mainCollectionTableView: UITableView = {
        let tableView = UITableView()
        
        let storyView = StoryCollectionView()
        storyView.frame = .init(x: 0, y: 0, width: SizeLiteral.Screen.width, height: 115)
//        tableView.separatorStyle = .none
        tableView.tableHeaderView = storyView
        return tableView
    }()
    
    private let instagramLogoImageView = UIImageView(image: ImageLiteral.NavBar.MainFeed.instagramLogo)
    
    private let dmButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.NavBar.MainFeed.dmBlack, for: .normal)
        return button
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.NavBar.MainFeed.likeBlack, for: .normal)
        return button
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dmButton, likeButton])
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 25
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    // MARK: - Setting
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let logo = makeNavigationBarButton(with: instagramLogoImageView)
        navigationItem.leftBarButtonItem = logo
        
        let dmButton = makeNavigationBarButton(with: dmButton)
        let likeButton = makeNavigationBarButton(with: likeButton)
        let rightStackBarButtonItem = UIBarButtonItem(customView: rightStackView)
        navigationItem.rightBarButtonItem = rightStackBarButtonItem
    }
    
    override func setDelegate() {
        mainCollectionTableView.delegate = self
        mainCollectionTableView.dataSource = self
    }
    
    override func setLayout() {
        view.backgroundColor = . black
        view.addSubview(mainCollectionTableView)
        mainCollectionTableView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }

}


// MARK: - UITableView Delegate

extension MainFeedViewController: UITableViewDelegate {
    
}


// MARK: - UITableView DataSource

extension MainFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
