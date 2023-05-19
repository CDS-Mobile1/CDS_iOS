//
//  ViewController.swift
//  Instagram-iOS
//
//  Created by 김사랑 on 2023/05/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = UserProfileView(usedView: .story, storyStatus: .new)
        view.backgroundColor = .white
        view.addSubview(view1)
        view1.snp.makeConstraints {
            $0.size.equalTo(72)
            $0.center.equalToSuperview()
        }
    }


}

