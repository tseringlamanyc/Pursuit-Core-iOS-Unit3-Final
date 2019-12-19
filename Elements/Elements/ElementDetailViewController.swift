//
//  ElementDetailViewController.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ElementDetailViewController: UIViewController {
    
    @IBOutlet weak var elementBigImage: UIImageView!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var elementSymbol: UILabel!
    @IBOutlet weak var elementWeight: UILabel!
    @IBOutlet weak var boilingPoint: UILabel!
    @IBOutlet weak var meltingPoint: UILabel!
    @IBOutlet weak var discoveredBy: UILabel!

    var elements: AllElements!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        elementName.text = elements.name
        elementSymbol.text = "Symbol:\(elements.symbol)"
        elementWeight.text = "Weight: \(elements.atomicMass.description) U"
        boilingPoint.text = "Boiling Point: \(elements.boil?.description ?? "N/A")°F"
        meltingPoint.text = "Melting Point: \(elements.melt?.description ?? "N/A")°F"
        discoveredBy.text = "Discovered by: \(elements.discoveredBy ?? "N/A")"
        
        let imageURL = "http://images-of-elements.com/\(elements.name.lowercased()).jpg"
        
        elementBigImage.getImage(with: imageURL) { [weak self](result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.elementBigImage.image = UIImage(systemName: "exclamationmark.triabgle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementBigImage.image = image
                }
            }
        }
    }
    
    
    @IBAction func favoritePressed(_ sender: UIBarButtonItem) {
        
    }
}
