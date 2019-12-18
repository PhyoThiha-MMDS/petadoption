//
//  Extensions.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import UIKit

extension Data {
    
    func seralizeData<T>(for object: T.Type) -> T where T:Codable{
        let decoder = JSONDecoder()
        return try! decoder.decode(object, from: self)
    }
}
