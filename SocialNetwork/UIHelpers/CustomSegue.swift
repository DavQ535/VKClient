//
//  CustomSegue.swift
//  SocialNetwork
//
//  Created by David Varro on 21/08/2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    // MARK: - Private Properties
    private let animationDuration: TimeInterval = 1
    private let view = UINavigationController()

    // MARK: - Lifecycle
    override func perform() {
        guard let conteinerView = source.view else { return }
        conteinerView.addSubview(destination.view)
        
        destination.view.frame = conteinerView.frame
        destination.view.transform = CGAffineTransform(translationX: 0, y: -source.view.bounds.height)
        destination.modalPresentationStyle = .fullScreen
        UIView.animate(withDuration: animationDuration) {
            self.destination.view.transform = .identity
        }
        
    }
}
