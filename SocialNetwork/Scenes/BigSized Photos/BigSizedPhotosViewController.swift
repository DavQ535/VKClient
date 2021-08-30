//
//  BigSizedPhotosViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 16/08/2021.
//

import UIKit

private enum Contants {
    enum Identifiers {
        static let reuseID = "BigSizedPhotosCell"
    }
    
}


class BigSizedPhotosViewController: UIViewController {
    var friendPhotos = [UIImage]()
    var selectedIndex: Int = 0
    var friendPhoto: Friend?
    @IBOutlet weak  var collectionView: UICollectionView!
    private var isAlreadyShown = false
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = BigSizedPhotosCollectionViewFlowLayout(itemSize: BigSizedPhotosCollectionViewCell.cellSize)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}

extension BigSizedPhotosViewController: UICollectionViewDelegate,
                                        UICollectionViewDataSource,
                                        UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    friendPhotos.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigSizedPhotosCell", for: indexPath) as? BigSizedPhotosCollectionViewCell else { fatalError("Cannot") }
     
        cell.bigSizedPhotosImageView.image = friendPhotos[indexPath.row]
        cell.setNavigatableDelegate(self)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        guard !isAlreadyShown else { return }
        isAlreadyShown.toggle()

        let indexPath = IndexPath(row: selectedIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
}
