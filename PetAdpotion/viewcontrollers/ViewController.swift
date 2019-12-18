//
//  ViewController.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let mPresenter:LoginPresenterImpl = LoginPresenterImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mPresenter.attachView(view: self)
      
    }

    @IBAction func onClickGetStarted(_ sender: Any) {
        
        mPresenter.onClickGetStarted()
    }
    
}

extension ViewController : LoginView {
    
    func displayGreetingMessage(msg: String) {
        print(msg)
    }
    
    
}
