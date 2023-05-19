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
    
    let dummyView = UIView()
    
    private lazy var postContentTextView: UITextView = {
        let textView = UITextView()
        textView.text = postContentPlaceholder
        
        return textView
    }()
    
    // MARK: - Life Cycle
    
    
    
    // MARK: - Setting
    
    override func setDelegate() {
        postContentTextView.delegate = self
    }
    
    // MARK: - Action Helper
    
    
    
    // MARK: - Custom Method
    
    
    
    
}


// MARK: - UITextViewDelegate extension

extension NewPostViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == postContentPlaceholder {
            textView.text = nil
//            textView.textColor = UIColor.black1
        }
    }
    
}
