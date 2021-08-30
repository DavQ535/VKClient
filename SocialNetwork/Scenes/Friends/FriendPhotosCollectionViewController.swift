//
//  FriendPhotosCollectionViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 23/07/2021.
//

import UIKit

private enum Constants {
    
    enum Identifiers {
       static let bigSizedPhotosIdentifier = "ToBigSizedPhotos"
        static let reuseID = "FriendPhotosCollectionViewCell"
    }
}

class FriendPhotosCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    private let animator = Animator()
    var friend: Friend!
    var selectedIndex = 0
    // MARK: - Outlets
    @IBOutlet private var friendPhotosCollectionView: UICollectionView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = friend.name
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Identifiers.bigSizedPhotosIdentifier {
            guard let photosVC = segue.destination as? BigSizedPhotosViewController else {
                return }
            photosVC.selectedIndex = selectedIndex
            photosVC.friendPhotos = (sender as? [UIImage]) ?? []
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let friend = friend.photos
        let bigSizedPhotosVC = BigSizedPhotosViewController()
        selectedIndex = indexPath.row
        bigSizedPhotosVC.selectedIndex = selectedIndex
        performSegue(withIdentifier: Constants.Identifiers.bigSizedPhotosIdentifier, sender: friend)
    }
    // MARK: - CollectionView DataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(FriendPhotosCollectionViewCell.self, for: indexPath)
        cell.friendPhotosImageView.image = friend.photos?[indexPath.row]
        cell.layer.cornerRadius = 12
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        return cell
    }
}
