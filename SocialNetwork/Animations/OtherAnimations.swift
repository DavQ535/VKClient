//
//  OtherAnimations.swift
//  SocialNetwork
//
//  Created by David Varro on 10/08/2021.
//

import UIKit

func avatarAnimation(for view: UIImageView) {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.9
    animation.toValue = 1
    animation.stiffness = 200
    animation.mass = 2
    animation.duration = 0.2
    animation.beginTime = CACurrentMediaTime()
    animation.fillMode = CAMediaTimingFillMode.backwards
    view.layer.add(animation, forKey: nil)
}
