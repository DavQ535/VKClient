//
//  BigSizedPhotosCollectionViewCell.swift
//  SocialNetwork
//
//  Created by David Varro on 16/08/2021.
//

import UIKit

protocol NavigatableViewController: AnyObject {

    var navigationController: UINavigationController? { get }
}

class BigSizedPhotosCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    @IBOutlet weak var bigSizedPhotosImageView: UIImageView!
    static let cellSize = CGSize(width: 350, height: 350)
    private weak var navigatorDelegate: NavigatableViewController?
    // MARK: - Methods
    @objc func handleSwipe(_ recognizer: UISwipeGestureRecognizer) {
        navigatorDelegate?.navigationController?.modalTransitionStyle = .partialCurl
        navigatorDelegate?.navigationController?.popViewController(animated: true)
    }
    func addSwipeGesture() {
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGestureRecognizer.direction = .up
        swipeGestureRecognizer.numberOfTouchesRequired = 1
        bigSizedPhotosImageView.isUserInteractionEnabled = true
        bigSizedPhotosImageView.addGestureRecognizer(swipeGestureRecognizer)
    }

    func setNavigatableDelegate(_ delegate: NavigatableViewController) {
        self.navigatorDelegate = delegate
    }
}
