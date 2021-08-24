//
//  GroupsVC + Extension.swift
//  SocialNetwork
//
//  Created by David Varro on 24/08/2021.
//

import UIKit

extension GroupsTableViewController {
        
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        groupSearchBar.placeholder = ""
        UISearchBar.animate(withDuration: 0.7, animations: {
            searchBar.setPositionAdjustment(.init(horizontal: 0, vertical: 0), for: .search)
            searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width + 80, height: searchBar.frame.height)
            self.groupSearchBar.setShowsCancelButton(true, animated: true)
            searchBar.searchTextField.backgroundColor = nil
        })
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        UISearchBar.animate(withDuration: 1, animations: {
            searchBar.setPositionAdjustment(.init(horizontal: self.view.center.x - 80, vertical: 0), for: .search)
            searchBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width - 20, height: searchBar.frame.height)
            searchBar.searchTextField.backgroundColor = .white
        }) { _ in self.groupSearchBar.placeholder = "Click to search"
        }
        self.groupSearchBar.searchTextField.text = ""
        self.filteredData = self.groups
        self.groupSearchBar.setShowsCancelButton(false, animated: true)
        self.tableView.reloadData()
    }
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText.isEmpty {
            filteredData = groups
        } else { for group in groups {

                if group.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(group)
                }
            }
        }
        tableView.reloadData()
    }
}
