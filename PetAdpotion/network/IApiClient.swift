//
//  IApiClient.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
protocol IApiClient {
    

    
    func getAllCategoriesRx() -> Observable<GetAllPetCategoryResponse>
    func getAllCats() -> Observable<GetAllCatsResponse>
}
