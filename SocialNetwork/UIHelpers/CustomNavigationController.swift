//
//  CustomNavigationController.swift
//  SocialNetwork
//
//  Created by David Varro on 21/08/2021.
//

import UIKit

// MARK: - UIPercentDrivenInteractiveTransition

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
}
// MARK: - CustonNavigationController

class CustonNavigationController: UINavigationController, UINavigationControllerDelegate {
     let interactiveTransition = CustomInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        let panGesRec = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handle(_:)))
        panGesRec.edges = .left
        view.addGestureRecognizer(panGesRec)
    }
    
    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationController.Operation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
//        switch operation {
//        case .push:
//
//        case .pop
//
//        default
//        return nil
//        }
        return nil
    }
}
// MARK: - Actions

extension CustonNavigationController {

    @objc private func handle(_ panGesture: UIPanGestureRecognizer) {
        switch panGesture.state {
        case .began:
            interactiveTransition.hasStarted = true
            self.popViewController(animated: true)

        case .changed:
            guard let width = panGesture.view?.bounds.width else {
                interactiveTransition.hasStarted = false
                interactiveTransition.cancel()
                return
            }

            let translation = panGesture.translation(in: panGesture.view)
            let translationPercent = translation.x / width
            let progress = max(0, min(1, translationPercent))
            interactiveTransition.update(progress)
            interactiveTransition.shouldFinish = progress > 0.35

        case .ended:
            interactiveTransition.hasStarted = false
            interactiveTransition.shouldFinish
                ? interactiveTransition.finish()
                : interactiveTransition.cancel()

        case .cancelled:
            interactiveTransition.hasStarted = false
            interactiveTransition.cancel()

        default:
            break
        }
    }
}
