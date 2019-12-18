//
//  PetTableViewCell.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import UIKit
import Kingfisher
class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPet: UIImageView!
    var mData:CatsVO?=nil{
        didSet{
            self.ivPet.kf.setImage(with: URL(string: mData!.image))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ivPet.layer.cornerRadius = 15
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
