//
//  CustomAvatarImageView.swift
//  SocialNetwork
//
//  Created by David Varro on 27/07/2021.
//

import UIKit

    class CustomAvatarImageView: UIImageView {
    
   private func makeroundedAvatar() {
        layer.borderWidth = 0
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeroundedAvatar()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeroundedAvatar()
    }
}
