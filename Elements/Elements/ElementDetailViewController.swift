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
        
        let favorite = AllElements.init(name: elements.name, atomicMass: elements.atomicMass, symbol: elements.symbol, number: elements.number, melt: elements.melt ?? 0.0, boil: elements.boil ?? 0.0, discoveredBy: elements.discoveredBy ?? "N/A", favoritedBy: "Tsering")
        
        ElementsAPI.postElements(favElement: favorite) { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Couldnt favorite", message: "\(appError)")
                }
            case .success(_):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Success", message: "Thanks") {alert in self?.dismiss(animated: true)}
                }
            }
        }
    }
}
