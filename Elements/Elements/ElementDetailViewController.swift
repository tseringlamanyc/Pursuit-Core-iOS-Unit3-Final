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
    }
    
    func updateUI() {
        elementName.text = elements.name
        elementSymbol.text = elements.symbol
        elementWeight.text = elements.atomicMass.description
        boilingPoint.text = elements.boil?.description ?? "N/A"
        meltingPoint.text = elements.melt?.description ?? "N/A"
        discoveredBy.text = elements.discoveredBy ?? "N/A"
        
        let imageURL = "http://images-of-elements.com/\(elements.name.lowercased()).jpg"
        
        elementBigImage.getImage(with: imageURL) { [weak self](result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.
                }
            }
        }
    }
    
    
    @IBAction func favoritePressed(_ sender: UIBarButtonItem) {
    }
}
