//
//  File.swift
//  SocialNetwork
//
//  Created by David Varro on 10/08/2021.
//

import UIKit

extension UITableViewController {
    func hideKeyboardOnTap() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
        @objc func hideKeyboard() {
            self.view.endEditing(true)
            
    }
}
