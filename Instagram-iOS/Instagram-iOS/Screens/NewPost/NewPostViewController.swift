//
//  NewPostViewController.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/19.
//

import UIKit

import SnapKit

final class NewPostViewController: BaseViewController {
    
    // MARK: - Property
    
    let postContentPlaceholder = "문구 입력..."
    
    // MARK: - UI Property
    
    // TODO: collectionview 추가
    let dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .green1
        return view
    }()
    
    private lazy var postContentTextView: UITextView = {
        let textView = UITextView()
        textView.text = postContentPlaceholder
        textView.textColor = .gray2
        textView.font = .bodyKor
        return textView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Setting
    
    override func setDelegate() {
        postContentTextView.delegate = self
    }
    
    override func setLayout() {
        view.addSubview(dummyView)
        dummyView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(80)
        }
        
        // TODO: 영역 정해지면 inset 값 수정하기
        view.addSubview(postContentTextView)
        postContentTextView.snp.makeConstraints {
            $0.top.equalTo(dummyView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}


// MARK: - UITextViewDelegate extension

extension NewPostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == postContentPlaceholder {
            textView.text = nil
            textView.textColor = .black1
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = postContentPlaceholder
            textView.textColor = .gray2
        }
    }
    
}
