//
//  DMList.swift
//  Instagram-iOS
//
//  Created by 백준 on 2023/05/15.
//

import UIKit

import SnapKit

final class DMListViewController: BaseViewController {
    
    // MARK: - Property
    
    // MARK: - UI Property
    
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
        let tableView = UITableView()
        tableView.register(DMTableviewCell.self, forCellReuseIdentifier: DMTableviewCell.identifier)
        tableView.register(DMTableViewHeader.self, forHeaderFooterViewReuseIdentifier: DMTableViewHeader.identifier)
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configDelegate()
    }
    
    // MARK: - Setting
    
    private func configDelegate() {
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
        navigationItem.rightBarButtonItems = [videoCallButtonItem, newMessageButtonItem]
    }
    
    override func setLayout() {
        
        view.addSubview(customNaviView)
        customNaviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        view.addSubview(DMListTableView)
        DMListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate
extension DMListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 82 + 90 + 22
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DMTableViewHeader.identifier) as! DMTableViewHeader
        return headerView
    }
}

//MARK: - UITableViewDataSource
extension DMListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // set your desired number of sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // set your desired number of rows per section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DMTableviewCell.identifier, for: indexPath) as! DMTableviewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74 // set your desired row height
    }
}

