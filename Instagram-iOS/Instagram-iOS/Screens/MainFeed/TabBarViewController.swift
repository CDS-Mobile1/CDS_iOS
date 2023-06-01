//
//  TabBarViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/26.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - UI Property
    
    let mainfeedVC = MainFeedViewController()
    let searchVC: UIImageView = {
        let vc = UIImageView()
        vc.image = ImageLiteral.TabBar.search
        return vc
    }()
    let newpostVC = NewPostViewController()
    let reelsVC: UIImageView = {
        let vc = UIImageView()
        vc.image = ImageLiteral.TabBar.reels
        return vc
    }()
    let profileVC: UIImageView = {
        let vc = UIImageView()
        vc.image = ImageLiteral.TabBar.profile
        return vc
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setItemStyle()
        setTabBarStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Setting
    
    func setItemStyle() {
        let searchTabBarItem = UITabBarItem(title: nil, image: searchVC.image, selectedImage: ImageLiteral.TabBar.searchFilled)
        let reelsTabBarItem = UITabBarItem(title: nil, image: reelsVC.image, selectedImage: nil)
        let profileTabBarItem = UITabBarItem(title: nil, image: profileVC.image, selectedImage: nil)
        
        mainfeedVC.tabBarItem.image = ImageLiteral.TabBar.home
        mainfeedVC.tabBarItem.selectedImage = ImageLiteral.TabBar.homeFilled
        newpostVC.tabBarItem.image = ImageLiteral.TabBar.newPost
        newpostVC.tabBarItem.selectedImage = ImageLiteral.TabBar.newPostFilled
        
        let navMainFeed = UINavigationController(rootViewController: mainfeedVC)
        let navSearch = UINavigationController()
        let navNewPost = UINavigationController(rootViewController: newpostVC)
        let navReels = UINavigationController()
        let navProfile = UINavigationController()
        
        navSearch.tabBarItem = searchTabBarItem
        navReels.tabBarItem = reelsTabBarItem
        navProfile.tabBarItem = profileTabBarItem
        
        setViewControllers([navMainFeed, navSearch, navNewPost, navReels, navProfile], animated: false)
    }
    
    func setTabBarStyle() {
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
    }
    
}
