//
//  AvailableToJoinCell.swift
//  SocialNetwork
//
//  Created by David Varro on 25/07/2021.
//
import UIKit

class AvailableToJoinCell: UITableViewCell {

    @IBOutlet weak var availblegroupImage: UIImageView!
    @IBOutlet weak var availablegroupName: UILabel!

    func configure(with data: AvailableToJoin ) {
        availblegroupImage.image = data.logo
        availablegroupName.text = data.name
    }
    
}
