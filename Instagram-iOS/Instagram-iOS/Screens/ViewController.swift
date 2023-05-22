//
//  ViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/15.
//

import UIKit

class ViewController: UIViewController {

    private func presentStoryViewController() {
        self.navigationController?.pushViewController(StoryViewController(userId: 1), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UserProfileView(usedView: .dm, storyStatus: .none)
        let action = UIAction { [weak self] _ in
            self?.presentStoryViewController()
        }
        view1.addProfileButtonAction(action)
        view.backgroundColor = .white
        view.addSubview(view1)
        view1.snp.makeConstraints {
            $0.size.equalTo(72)
            $0.center.equalToSuperview()
        }
    }


}

