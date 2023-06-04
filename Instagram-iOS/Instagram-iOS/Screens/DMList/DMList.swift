//
//  DMList.swift
//  Instagram-iOS
//
//  Created by 백준 on 2023/05/15.
//

import UIKit
import SnapKit

final class DMListViewController: BaseViewController {
    
    // MARK: - UI Property
    
    private let headerView = DMTableViewHeader()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .title1
        label.textColor = .black1
        label.text = "gosopt_cds_app1"
        return label
    }()
    
    let arrowDownButton = UIButton()
    
    let videoCallButton = UIButton()
    
    let newMessageButton = UIButton()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.NavBar.DMList.arrowBack, for: .normal)
        return button
    }()
    
    let customNaviView = UIView()
    
    private let DMListTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorColor = .clear
        tableView.register(DMTableViewCellHeader.self, forHeaderFooterViewReuseIdentifier: DMTableViewCellHeader.identifier)
        tableView.register(DMTableviewCell.self, forCellReuseIdentifier: DMTableviewCell.identifier)
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
    }
    
    private func configTableView() {
        DMListTableView.delegate = self
        DMListTableView.dataSource = self
    }
    
    override func setNavigationBar() {
        super.setNavigationBar()
        
        let backButtonItem = UIBarButtonItem(customView: backButton)
        
        let userNameLabelItem = UIBarButtonItem(customView: userNameLabel)
        
        let arrowDownButtonItem = UIBarButtonItem(customView: arrowDownButton)
        
        let videoCallButtonItem = UIBarButtonItem(customView: videoCallButton)
        
        let newMessageButtonItem = UIBarButtonItem(customView: newMessageButton)
        
        arrowDownButton.setImage(ImageLiteral.NavBar.DMList.arrowBottom, for: .normal)
        videoCallButton.setImage(ImageLiteral.NavBar.DMList.camera, for: .normal)
        newMessageButton.setImage(ImageLiteral.NavBar.DMList.newDM, for: .normal)
        navigationItem.leftBarButtonItems = [backButtonItem, userNameLabelItem, arrowDownButtonItem]
        navigationItem.rightBarButtonItems = [newMessageButtonItem, videoCallButtonItem]
    }
    
    override func setLayout() {
        view.addSubview(customNaviView)
        customNaviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }

        DMListTableView.tableHeaderView = headerView
        
        view.addSubview(DMListTableView)
        DMListTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate

extension DMListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        switch section {
//        case 0:
//            return DMTableViewHeader()
//        default:
//            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DMTableViewCellHeader.identifier) as? DMTableViewCellHeader else {fatalError("header fail")}
//            return header
//        }
        return DMTableViewHeader()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section {
//        case 0:
//            return 172
//        default:
//            return 47
//        }
        
        return 172 + 42
    }
}

//MARK: - UITableViewDataSource

extension DMListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DMTableviewCell.identifier, for: indexPath) as! DMTableviewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}
