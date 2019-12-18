//
//  RemoteModelImpl.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
class RemoteModelImpl: BaseModel {
    
    // MARK: - Properties
    static let shared = RemoteModelImpl()
    
    // Initialization
    private override init() {}
    
}

extension RemoteModelImpl : RemoteModel {
    
    func getAllCategoriesFromApi2() -> Observable<GetAllPetCategoryResponse> {
        
      return SharedApiClient.shared.getAllCategoriesRx()
    }
    

    
    
}
