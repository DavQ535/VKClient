//
//  CustomLoginButton.swift
//  SocialNetwork
//
//  Created by David Varro on 29/07/2021.
//

import UIKit
class CustomLoginButton: UIButton {
    private func addShadowandCorner() {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1
        layer.masksToBounds = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
       addShadowandCorner()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addShadowandCorner()
    }
}
