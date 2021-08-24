//
//  FriendsTableViewCell.swift
//  SocialNetwork
//
//  Created by David Varro on 23/07/2021.
//

import UIKit

  class FriendsTableViewCell: UITableViewCell {
    //MARK: -Outlets
    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var avatarShadowView: UIView!
    // MARK: - Functions
    func configure(with data: Friend) {
        friendImage.image = data.avatar
        friendName.text = data.name
    }
    func setShadow() {
        if friendImage.backgroundColor != .clear {
        avatarShadowView.clipsToBounds = false
        avatarShadowView.layer.shadowColor = UIColor.black.cgColor
        avatarShadowView.layer.shadowOpacity = 1
        avatarShadowView.layer.shadowOffset = CGSize.zero
        avatarShadowView.layer.shadowRadius = 6
        avatarShadowView.layer.cornerRadius = frame.size.width / 2
        avatarShadowView.layer.shadowPath = UIBezierPath(roundedRect: avatarShadowView.bounds, cornerRadius: frame.size.width / 2).cgPath
        }
    }
}
