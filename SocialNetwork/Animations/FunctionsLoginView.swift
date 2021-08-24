//
//  File.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

 func animateOpacity(for view: UIView) {
    let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
    fadeInAnimation.fromValue = 0
    fadeInAnimation.toValue = 1
    fadeInAnimation.duration = 1
    fadeInAnimation.beginTime = CACurrentMediaTime() + 0.5
    fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
    view.layer.add(fadeInAnimation, forKey: nil)
}

func transformAnimation(for view: UIView) {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0
    animation.toValue = 1
    animation.stiffness = 200
    animation.mass = 2
    animation.duration = 2
    animation.beginTime = CACurrentMediaTime() + 0.5
    animation.fillMode = CAMediaTimingFillMode.backwards
    
    view.layer.add(animation, forKey: nil)
}

func animateTitlesAppearing(for view: UIView, and view1: UIView) {
    view.transform = CGAffineTransform(translationX: -780, y: 0)
    view1.transform = CGAffineTransform(translationX: -780, y: 0)
    
    UIView.animate(withDuration: 1,
                   delay: 0.5,
                   options: .curveEaseOut,
                   animations: {
                       view.transform = .identity
                    view1.transform = .identity
                   },
                   completion: nil)
}

func transformAnimationImageView(for view: UIImageView) {
    let animation = CASpringAnimation(keyPath: "transform.scale")
    animation.fromValue = 0
    animation.toValue = 1
    animation.stiffness = 200
    animation.mass = 2
    animation.duration = 2
    animation.beginTime = CACurrentMediaTime() + 0.5
    animation.fillMode = CAMediaTimingFillMode.backwards
    view.layer.add(animation, forKey: nil)
}
