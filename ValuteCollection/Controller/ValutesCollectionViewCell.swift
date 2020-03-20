//
//  ValutesCollectionViewCell.swift
//  ValuteCollection
//
//  Created by Egor on 19.03.2020.
//  Copyright © 2020 Egor. All rights reserved.
//

import UIKit

class ValutesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var valute: Valute? {
        didSet {
            self.codeLabel.text = self.valute?.code
            self.rateLabel.text = self.valute?.rate
        }
    }

}
