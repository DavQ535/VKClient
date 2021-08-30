//
//  NewsCollectionViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 28/08/2021.
//

import UIKit

private enum Constants {
    enum Identifiers {
        static let reuseID = "NewsCollectionViewCell"
    }
    
}

class NewsCollectionViewController: UICollectionViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = NewsCollectionViewFlowLayout(itemSize: NewsCollectionViewCell.cellSize)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast

    }
    
    override func collectionView(
      _ collectionView: UICollectionView,
      viewForSupplementaryElementOfKind kind: String,
      at indexPath: IndexPath
    ) -> UICollectionReusableView {
      
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: "Header", withReuseIdentifier: "Header", for: indexPath) as? NewsCollectionReusableView else { fatalError("cannot")}
        
        return headerView
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.reuseID, for: indexPath) as? NewsCollectionViewCell else {fatalError("Cannot dequeue reusable cell with identifier")}
        cell.newsAvatarImageView.image = UIImage(named: "elon2")
        cell.layer.cornerRadius = 12
    
        return cell
    }


}
