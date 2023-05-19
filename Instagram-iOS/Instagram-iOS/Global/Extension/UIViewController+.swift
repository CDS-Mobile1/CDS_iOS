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
    
    func makeNavigationBarButtonItemArea(with button: UIButton) -> UIView {
        let offsetView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        offsetView.addSubview(button)
        return offsetView
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
