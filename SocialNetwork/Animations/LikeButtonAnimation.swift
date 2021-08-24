//
//  LikeButtonAnimation.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

func likeButtonPressedAnimation(for view: UIView) {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0.8
    animation.toValue = 1.2
    animation.stiffness = 50
    animation.mass = 1
    animation.duration = 0.3
    animation.beginTime = CACurrentMediaTime()
    animation.fillMode = CAMediaTimingFillMode.backwards
    view.layer.add(animation, forKey: nil)
    
}
