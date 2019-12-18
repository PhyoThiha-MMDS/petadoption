//
//  LoginPresenter.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
protocol LoginPresenter {
    
    func onUIReady()
    func attachView(view:LoginView)
    func onClickGetStarted()
}
