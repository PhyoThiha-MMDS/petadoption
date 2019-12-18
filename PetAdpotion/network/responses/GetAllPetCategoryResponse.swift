//
//  GetAllPetCategoryResponse.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
class GetAllPetCategoryResponse: Codable  {
    
    var code:Int = 0
    var message:String = ""
    var data:[CategoryVO] = []
}
