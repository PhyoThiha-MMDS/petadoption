//
//  ErrorResponse.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 09/11/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
public class ErrorResponse : Codable {
   public let code:Int?
   public let message:String?
}
