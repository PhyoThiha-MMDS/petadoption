//
//  PetListPresenter.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
protocol PetListPresenter {
    func onUIReady()
    func attachView(view:PetListView)
}
