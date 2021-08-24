//
//  GroupDetalis.swift
//  SocialNetwork
//
//  Created by David Varro on 25/07/2021.
//

import UIKit

struct Groups {
    let name: String
    let logo: UIImage?
    
    static var groups = [
    Groups(name: "NASA", logo: UIImage(named: "nasa")!),
        Groups(name: "SpaceX", logo: UIImage(named: "spacex")!),
        Groups(name: "Роскосмос", logo: UIImage(named: "roscosmos")!),
        Groups(name: "Москва", logo: UIImage(named: "moscow")!),
        Groups(name: "GeekBrains", logo: UIImage(named: "gb")!)
    ]
}
