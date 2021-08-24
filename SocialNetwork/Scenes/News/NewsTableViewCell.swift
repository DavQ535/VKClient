//
//  NewsTableViewCell.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    @IBOutlet weak var newsPosterView: UIView!
    
    func newsPosterViewConfig() {
        newsPosterView.layer.borderColor = UIColor.lightGray.cgColor
        newsPosterView.layer.borderWidth = 0.4
    }
    
}
