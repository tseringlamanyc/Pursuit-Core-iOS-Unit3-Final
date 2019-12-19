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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func favoritePressed(_ sender: UIBarButtonItem) {
    }
}
