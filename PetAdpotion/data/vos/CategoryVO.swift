//
//  CategoryVO.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
class CategoryVO:Codable {
    
    var id:Int = 0
    var name:String = ""
    var icon:String = ""
    
    
    enum CodingKeys: String, CodingKey {
        case id, name,icon
    }
}
