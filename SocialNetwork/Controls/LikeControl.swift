//
//  LikeandShowPicture.swift
//  SocialNetwork
//
//  Created by David Varro on 30/07/2021.
//

import UIKit

class LikeControl: UIView {
        
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeCounter: UILabel!
   // MARK: - Methods
    func likeLabelChangingAnimation(text: String) {
        let animation: CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.reveal
        animation.subtype = CATransitionSubtype.fromTop
        self.likeCounter.text = text
        animation.duration = 0.25
        self.likeCounter.layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
    
    @IBAction func likeButtonPressed( _ sender: UIButton) {
        if likeButton.tag == 0 {
            likeButtonPressedAnimation(for: likeButton)
            likeLabelChangingAnimation(text: "1")
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tag = 1
        } else {
            likeButtonPressedAnimation(for: likeButton)
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            likeButton.tag = 0
            likeLabelChangingAnimation(text: "0")
            }
        }
    }
