//
//  GroupsTableViewCell.swift
//  SocialNetwork
//
//  Created by David Varro on 25/07/2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupName: UILabel!
    
    func configure(with data: Groups) {
        groupName.text = data.name
        groupImage.image = data.logo
    }
}
