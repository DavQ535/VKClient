//
//  AvailableToJoinTableViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 25/07/2021.
//

import UIKit

 private enum Constants {
    enum Identifiers {
        
    }
}

class AvailableToJoinTableViewController: UITableViewController {
    // MARK: - Properties
    var availableGroups = AvailableToJoin.availableToJoin
    private var cellID = "AvailableToJoinCell"
    // MARK: - Outlets
    @IBOutlet private var availableToJoin: UITableView!
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AvailableToJoinCell.self, for: indexPath)
        cell.configure(with: availableGroups[indexPath.row])
        return cell
    }
}
