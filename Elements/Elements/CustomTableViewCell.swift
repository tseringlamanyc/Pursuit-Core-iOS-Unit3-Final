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
        
        
        
        
        elementImage.getImage(with: <#T##String#>, completion: <#T##(Result<UIImage, AppError>) -> ()#>)
    }
    
}
