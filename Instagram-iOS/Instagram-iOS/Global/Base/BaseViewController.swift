//
//  BaseViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/17.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setNavigationBar()
        setDelegate()
        setLayout()
        setStyle()
    }
    
    // MARK: - Setting
    
    func setBackgroundColor() {
        view.backgroundColor = .white1
    }
    
    func setNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar
        else { return }
        
        let appearance = UINavigationBarAppearance()
        // FIXME: 색상 asset 추가 된 뒤 base color 로 바꾸기
        appearance.backgroundColor = .white
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setDelegate() {
        // override to use
    }
    
    func setLayout() {
        // override to use
    }
    
    func setStyle() {
        self.view.backgroundColor = .white1
    }
    
}
