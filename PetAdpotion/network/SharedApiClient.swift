//
//  SharedApiClient.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
class SharedApiClient:BaseApiClient{
    
    // MARK: - Properties
    
    static let shared = SharedApiClient()
    

    // Initialization
    private override init() {}
}

extension SharedApiClient : IApiClient {
    
    
    func getAllCats() -> Observable<GetAllCatsResponse> {
        
        return self.reuqestApiWithHeaders2(url: API_GET_ALL_CATS, method: .post, params: [:], value: GetAllCatsResponse.self)
    }

    
    func getAllCategoriesRx() -> Observable<GetAllPetCategoryResponse> {
        
        return self.reuqestApiWithHeaders2(url: API_GET_ALL_CATEGORIES, method: .get, params: [:], value: GetAllPetCategoryResponse.self)
        
    }
    
   
    
    
}
