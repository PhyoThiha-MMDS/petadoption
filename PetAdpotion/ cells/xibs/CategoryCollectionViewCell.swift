//
//  CategoryCollectionViewCell.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ivCategory: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

        ivCategory.layer.cornerRadius = 15
        
    }

}
