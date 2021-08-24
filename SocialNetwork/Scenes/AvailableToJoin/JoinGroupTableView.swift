//
//  FriendsTableView.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

class JoinGroupTableView: UITableView {

   private var height: NSLayoutConstraint?
   private var bottom: NSLayoutConstraint?
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let header = tableHeaderView  else { return }
        if let imageView =  tableHeaderView?.subviews.first as? UIImageView {
            height = imageView.constraints.filter {$0.identifier == "height"}.first
            bottom = header.constraints.filter {$0.identifier == "bottom"}.first
        }
        let offsetY = -contentOffset.y
        height?.constant = max(header.bounds.height, header.bounds.height + offsetY)
        bottom?.constant = offsetY >= 0 ? 0 : offsetY/2
        header.clipsToBounds = offsetY <= 0
    }
}
