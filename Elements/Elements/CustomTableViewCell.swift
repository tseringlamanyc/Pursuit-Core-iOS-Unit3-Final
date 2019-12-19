//
//  CustomTableViewCell.swift
//  Elements
//
//  Created by Tsering Lama on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var elementName: UILabel!
    @IBOutlet weak var symbolName: UILabel!
    @IBOutlet weak var weightName: UILabel!
    
    func loadCell(element: AllElements) {
        elementName.text = element.name
        symbolName.text = element.symbol
        weightName.text = element.atomicMass.description
        
        let imageURL = "http://www.theodoregray.com/periodictable/Tiles/018/s7.JPG"
        
        elementImage.getImage(with: imageURL) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.elementImage.image = UIImage(systemName: "exclamationmark.triabgle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementImage.image = image
                }
            }
        }
    }
    
}
