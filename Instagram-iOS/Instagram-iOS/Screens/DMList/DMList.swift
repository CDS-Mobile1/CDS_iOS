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
    
    let header = UIView()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .bodyKorBold
        label.textColor = .black1
        label.text = "즐겨찾기"
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray5
        textField.font = .body
        //TODO: - 추후 placeholder 세팅 시 추가하겠습니다
        //        textField.placeholder = "검색"
        return textField
    }()
    
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
    
//    private let searchTextField: UITextField = {
//        let textField = UITextField()
//        textField.backgroundColor = .gray5
//        textField.font = .body
//        //TODO: - 추후 placeholder 세팅 시 추가하겠습니다
////        textField.placeholder = "검색"
//        return textField
//    }()
    
    private let DMListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DMTableViewCellHeader.self, forHeaderFooterViewReuseIdentifier: DMTableViewCellHeader.identifier)
        tableView.register(DMTableviewCell.self, forCellReuseIdentifier: DMTableviewCell.identifier)
        return tableView
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setSearchTextFieldUI()
        configDelegate()
        setSearchTextFieldUI()
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
        navigationItem.rightBarButtonItems = [newMessageButtonItem, videoCallButtonItem]
    }
    
    override func setLayout() {
        
        DMListTableView.tableHeaderView = header
        
        view.addSubview(header)
        header.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(155)
        }
        
        header.addSubview(searchTextField)
        searchTextField.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(35)
        }
        
        view.addSubview(customNaviView)
        customNaviView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
//        view.addSubview(searchTextField)
//        searchTextField.snp.makeConstraints {
//            $0.top.equalTo(customNaviView.snp.bottom).offset(8)
//            $0.centerX.equalToSuperview()
//            $0.leading.equalToSuperview().offset(16)
//            $0.height.equalTo(35)
//        }
        
        view.addSubview(DMListTableView)
        DMListTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setSearchTextFieldUI() {
        
        searchTextField.layer.cornerRadius = 10
        searchTextField.backgroundColor = .gray5
        searchTextField.font = .body
        //        searchTextField.attributedPlaceholder = NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
    }
}

//MARK: - UITableViewDelegate

extension DMListViewController: UITableViewDelegate {}

//MARK: - UITableViewDataSource

extension DMListViewController: UITableViewDataSource {
    
    //MARK: - Header
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1 // set your desired number of sections
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DMTableViewCellHeader.identifier) as? DMTableViewCellHeader else {
            fatalError("header fail")
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
    
    //MARK: - Cells
    
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
