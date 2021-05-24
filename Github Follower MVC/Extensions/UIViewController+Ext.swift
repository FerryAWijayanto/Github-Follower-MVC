//
//  UIViewController+Ext.swift
//  Github Follower MVC
//
//  Created by Ferry Adi Wijayanto on 02/05/21.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        let alert                       = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alert.modalPresentationStyle    = .overFullScreen
        alert.modalTransitionStyle      = .crossDissolve
        self.present(alert, animated: true)
    }
}
