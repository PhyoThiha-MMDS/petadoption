//
//  SharedApiClient.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
class SharedApiClient:BaseApiClient{
    
    // MARK: - Properties
    
    static let shared = SharedApiClient()
    

    // Initialization
    
    private override init() {}
}

extension SharedApiClient : IApiClient {
    
}
