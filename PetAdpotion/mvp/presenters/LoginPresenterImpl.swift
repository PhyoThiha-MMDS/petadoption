//
//  LoginPresenterImpl.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
class LoginPresenterImpl: BasePresenter {
    
    var mView:LoginView? = nil
    
}

extension LoginPresenterImpl : LoginPresenter {
    
    func onUIReady() {
        
    }
    
    func attachView(view: LoginView) {
        
        mView = view
    }

    func onClickGetStarted() {
        
        mView?.displayGreetingMessage(msg: "Hello")
        
    }

    
}
