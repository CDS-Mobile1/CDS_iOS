//
//  UIViewController+.swift
//  Instagram-iOS
//
//  Created by 이성민 on 2023/05/18.
//

import UIKit

extension UIViewController {
    
    // MARK: - navigationBar
    
    func makeNavigationBarButton<T: UIView>(with view: T) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
    
    func makeNavigationBarButtonItemArea(with button: UIButton, to size: CGRect) -> UIView {
        let offsetView = UIView(frame: size)
        offsetView.addSubview(button)
        return offsetView
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - keyboard dismiss
    
    func hideKeyboardWhenTappedAround() {
         let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
         tap.cancelsTouchesInView = false
         view.addGestureRecognizer(tap)
     }

     @objc
     func dismissKeyboard() {
         view.endEditing(true)
     }
    
}
