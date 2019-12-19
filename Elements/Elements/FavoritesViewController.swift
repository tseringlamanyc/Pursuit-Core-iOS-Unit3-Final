//
//  FavoritesViewController.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favorite = [AllElements]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFavorite()
        tableView.dataSource = self
    }
    
    func loadFavorite() {
        ElementsAPI.getFavorites { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "No elements found", message: "\(appError)")
                }
            case .success(let favorite):
                DispatchQueue.main.async {
                    self?.favorite = favorite.filter {$0.favoritedBy == "Tsering"}
                }
            }
        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favCell", for: indexPath)
        let aFavorite = favorite[indexPath.row]
        cell.textLabel?.text = aFavorite.name
        return cell
    }
    
    
}
