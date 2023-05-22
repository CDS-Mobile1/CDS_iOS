//
//  MainFeedViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/20.
//

import UIKit

class MainFeedViewController: BaseViewController {

    // MARK: - Property
    
    // MARK: - UI Property
    
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
    
    lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dmButton, likeButton])
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 30
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    // MARK: - Setting
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let logo = makeNavigationBarButton(with: instagramLogoImageView)
        navigationItem.leftBarButtonItem = logo
        
        let dmButton = makeNavigationBarButton(with: dmButton)
        let likeButton = makeNavigationBarButton(with: likeButton)
        navigationItem.rightBarButtonItems = [
            dmButton,
            likeButton
        ]
        
        let rightStackBarButtonItem = UIBarButtonItem(customView: rightStackView)
        navigationItem.rightBarButtonItem = rightStackBarButtonItem
    }
    
    override func setLayout() {

    }
    
    // MARK: - Action Helper
    
    // MARK: - Custom Method
    

    

}
