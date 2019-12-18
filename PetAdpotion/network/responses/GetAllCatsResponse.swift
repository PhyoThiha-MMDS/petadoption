//
//  GetAllCatsResponse.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 10/11/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
class GetAllCatsResponse: Codable {
    
    let code:Int
    let message:String
    var data:[CatsVO] = []
}
