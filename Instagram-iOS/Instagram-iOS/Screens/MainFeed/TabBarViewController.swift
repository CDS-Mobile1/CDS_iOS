//
//  TabBarViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/26.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: - Property
    
    // MARK: - UI Property
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let searchTabBarItem = UITabBarItem(title: nil, image: searchVC.image, selectedImage: nil)
        let reelsTabBarItem = UITabBarItem(title: nil, image: reelsVC.image, selectedImage: nil)
        let profileTabBarItem = UITabBarItem(title: nil, image: profileVC.image, selectedImage: nil)
        
        mainfeedVC.tabBarItem.image = ImageLiteral.TabBar.home
        newpostVC.tabBarItem.image = ImageLiteral.TabBar.newPost
        
        let navMainFeed = UINavigationController(rootViewController: mainfeedVC)
        let navSearch = UINavigationController()
        let navNewPost = UINavigationController(rootViewController: newpostVC)
        let navReels = UINavigationController()
        let navProfile = UINavigationController()
        
        navSearch.tabBarItem = searchTabBarItem
        navReels.tabBarItem = reelsTabBarItem
        navProfile.tabBarItem = profileTabBarItem
        
        setViewControllers([navMainFeed, navSearch, navNewPost, navReels, navProfile], animated: false)
        
        setTabBarBackgroundColor()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Setting
    
    func setTabBarBackgroundColor() {
            tabBar.barTintColor = .white
            tabBar.isTranslucent = false
        }
    
    
    // MARK: - Action Helper
    
    // MARK: - Custom Method
    
    

}
