//
//  GroupsTableViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 25/07/2021.
//

import UIKit

class GroupsTableViewController: UITableViewController, UISearchBarDelegate {
    // MARK: - Properties
    private var cellID = "GroupsTableViewCell"
    var groups = Groups.groups
    var filteredData = Groups.groups
    // MARK: - Outlets
    @IBOutlet var groupsTableView: UITableView!
    @IBOutlet weak var groupSearchBar: UISearchBar!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        groupSearchBar.delegate = self
        groupSearchBar.searchTextField.alpha = 0.75
        groupSearchBar.searchTextField.backgroundColor = .white
        groupSearchBar.placeholder = "Click to search"
        groupSearchBar.setPositionAdjustment(.init(horizontal: groupSearchBar.center.x - 80, vertical: 0), for: .search)
        filteredData = groups
    }
    // MARK: - Methods
   
    @IBAction private func goBackToGroups(with segue: UIStoryboardSegue) {
        guard let groupsVC = segue.source as? AvailableToJoinTableViewController,
              let indexPath = groupsVC.tableView.indexPathForSelectedRow
        else { return }
        let addedGroup = groupsVC.availableGroups[indexPath.row]
          if !groups.contains(where: {group -> Bool in group.name == addedGroup.name}) {
            groups.append(Groups(name: addedGroup.name, logo: addedGroup.logo))
            filteredData = groups
            AvailableToJoin.availableToJoin.remove(at: indexPath.row)
            tableView.reloadData()
      }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(GroupsTableViewCell.self, for: indexPath)
        cell.configure(with: filteredData[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedGroup = groups[indexPath.row]
            groups.remove(at: indexPath.row)
            filteredData = groups
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if !AvailableToJoin.availableToJoin.contains(where: {group -> Bool in group.name == deletedGroup.name}) {
                AvailableToJoin.availableToJoin.append(AvailableToJoin(name: deletedGroup.name,
                    logo: deletedGroup.logo))
                tableView.reloadData()
          }
        default:
            return
        }
    }
}
