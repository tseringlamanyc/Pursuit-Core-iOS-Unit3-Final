//
//  ViewController.swift
//  Elements
//
//  Created by Alex Paul on 12/31/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ElementViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var elements = [AllElements]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadElements()
    }
    
    func loadElements() {
        ElementsAPI.getElements { [weak self ] (result) in
            switch result {
            case .failure(let appError):
                print("\(appError)")
            case .success(let elements):
                self?.elements = elements
            }
        }
    }
    
    
}

extension ElementViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "elementCell", for: indexPath) as? CustomTableViewCell else {
            fatalError()
        }
        let aElement = elements[indexPath.row]
        cell.loadCell(element: aElement)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
