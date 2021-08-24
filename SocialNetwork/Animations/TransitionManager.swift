//
//  TransitionManager.swift
//  SocialNetwork
//
//  Created by David Varro on 20/08/2021.
//

import UIKit

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    
}
