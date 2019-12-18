//
//  RemoteModel.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
protocol RemoteModel {

    
    func getAllCategoriesFromApi2() -> Observable<GetAllPetCategoryResponse>
}
