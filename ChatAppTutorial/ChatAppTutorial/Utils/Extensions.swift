//
//  Extensions.swift
//  ChatAppTutorial
//
//  Created by e2phus on 2022/12/30.
//

import UIKit
import JGProgressHUD

extension UIViewController {
    static let hud = JGProgressHUD(style: .dark)
    
    func showLoader(_ show: Bool, withText text: String = "Loading") {
        view.endEditing(true)
        
        UIViewController.hud.textLabel.text = text
        
        if show {
            UIViewController.hud.show(in: view)
        } else {
            UIViewController.hud.dismiss()
        }
    }
}
