//
//  NewsViewController.swift
//  SocialNetwork
//
//  Created by David Varro on 08/08/2021.
//

import UIKit

class NewsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var newsTableView: UITableView!
    @IBOutlet private var customNavigationBarView: UIView!
    // MARK: - Life cycle
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        customNavigationBarView.alpha = 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 0.8) {
            self.customNavigationBarView.alpha = 1
        }
    }
    private func setupNavBar() {
        navigationController?.navigationBar.addSubview(customNavigationBarView)
        customNavigationBarView.frame = (navigationController?.navigationBar.bounds)!
    }
}
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(NewsTableViewCell.self, for: indexPath)
        cell.newsPosterViewConfig()
        return cell
        
    }
}
