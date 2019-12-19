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
        
        var intString = String(element.number)
        
        if intString.count == 1 {
            intString = "00" + intString
        } else if intString.count == 2 {
            intString = "0" + intString
        }
    
        let imageURL = "http://www.theodoregray.com/periodictable/Tiles/\(intString)/s7.JPG"
        
        elementImage.getImage(with: imageURL) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.elementImage.image = UIImage(systemName: "exclamationmark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.elementImage.image = image
                }
            }
        }
    }
    
}
