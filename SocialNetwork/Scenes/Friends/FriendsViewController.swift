//
//  FriendsViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 23/07/2021.
//

import UIKit

class FriendsViewController: UITableViewController {

    private enum Constants {
        enum Segues {
            static let toPhoto = "ToPhoto"
        }
        enum CellIdentifiers {
            static let friendCell = "FriendsTableViewCell"
        }
        enum Durations {
            static let simplyDuration: TimeInterval = 0.2
        }
    }
    // MARK: - Properties
    private let cellID = "FriendsTableViewCell"
    private let viewID = "ToPhoto"
    var friends = Friend.friends
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        (firstCharacter, sortedFriends) = sort(friends)
    }

    // MARK: - Outlets
    @IBOutlet private var friendsTableView: UITableView!
    // MARK: - Sorting
    private var firstCharacter = [Character]()
    private var sortedFriends: [Character: [Friend]] = [:]
    // MARK: - Methods
    private func sort(_ friends: [Friend]) -> (characters: [Character], sortedFriends: [Character: [Friend]]) {
        var characters = [Character]()
        var sortedFriends = [Character: [Friend]]()
        friends.forEach { friends in
            guard let character = friends.name.first else {return}
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friends)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friends]
                characters.append(character)
            }
        }
        characters.sort()
        return (characters, sortedFriends)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.toPhoto {
            guard
                let photosVC = segue.destination as? FriendPhotosCollectionViewController,
                let friends = sender as? Friend
            else { return }
            photosVC.friend = friends
        }
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
            return firstCharacter.map { String($0) }
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = firstCharacter[indexPath.section]
        let friendlist = sortedFriends[character]
        let friend = friendlist![indexPath.row]
        guard let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell else { return }
        avatarAnimation(for: cell.friendImage)
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Durations.simplyDuration) {
            self.performSegue(withIdentifier: Constants.Segues.toPhoto, sender: friend)
        }

    }
    // Set number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firstCharacter.count
    }
    // Set number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let character = firstCharacter[section]
        let friendsCount = sortedFriends[character]?.count
        return friendsCount ?? 0
    }
    // Cell Configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(FriendsTableViewCell.self, for: indexPath)
        let character = firstCharacter[indexPath.section]
        guard let friends = sortedFriends[character] else { return UITableViewCell() }
        cell.configure(with: friends[indexPath.row])
        cell.setShadow()
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        String(firstCharacter[section])
    }
}
