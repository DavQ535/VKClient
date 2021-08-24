//
//  CellConfigurator.swift
//  SocialNetwork
//
//  Created by David Varro on 23/08/2021.
//

import UIKit

protocol CellConfigurator {
    static var reuseID: String { get }
    static var nib: UINib { get }
}

extension CellConfigurator {
    static var reuseID: String {
        String(describing: self)
    }
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UIView: CellConfigurator {}

extension UITableView {
    func register<Cell: UITableViewCell>(_: Cell.Type) {
        self.register(Cell.nib, forCellReuseIdentifier: Cell.reuseID)
    }
    func dequeueReusableCell<Cell: UITableViewCell>(_ : Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: Cell.reuseID, for: indexPath) as? Cell else {
            fatalError("Error: Cannot dequeue cell with identifier \(Cell.reuseID)")
        }
        return cell
    }
}

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_: Cell.Type) {
        self.register(Cell.nib, forCellWithReuseIdentifier: Cell.reuseID)
    }
    func dequeueReusableCell<Cell: UICollectionViewCell>(_ : Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reuseID, for: indexPath) as? Cell  else {
            fatalError("Error: Cannot dequeue cell with identifier \(Cell.reuseID)")
        }
        return cell
    }
}
