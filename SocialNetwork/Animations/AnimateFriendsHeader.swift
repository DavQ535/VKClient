//
//  AnimateFriendsHeader.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

func headerImageViewAnimation(for view: UIView) {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0
    animation.toValue = 1
    animation.stiffness = 100
    animation.mass = 1
    animation.duration = 0.5
    animation.beginTime = CACurrentMediaTime() + 0.5
    animation.fillMode = CAMediaTimingFillMode.backwards
    
    view.layer.add(animation, forKey: nil)
}

func animateWelcomeAppearing(for view: UIView) {
    view.transform = CGAffineTransform(translationX: 0, y: -240)
    UIView.animate(withDuration: 1,
                   delay: 0,
                   options: .curveLinear,
                   animations: {
                       view.transform = .identity
                   },
                   completion: nil)
}

func animatelogoutbutton(for view: UIView) {
    view.transform = CGAffineTransform(translationX: 100, y: 0)
    UIView.animate(withDuration: 1, delay: 0,
                   options: .curveEaseInOut, animations: {view.transform = .identity}, completion: nil)
}

