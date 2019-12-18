//
//  PetListPresenterImpl.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
class PetListPresenterImpl: BasePresenter {
    
    var mView:PetListView? = nil
    var categoryList:[CategoryVO] = []
    let bag = DisposeBag()
}

extension PetListPresenterImpl : PetListPresenter{
    
    func onUIReady() {
        
//        RemoteModelImpl.shared.getAllCategoriesFromApi(success: { (data) in
//            self.categoryList = data
//            self.mView?.displayCategories(data: self.categoryList)
//
//        }) { (error) in
//
//            self.mView?.displayError(error: error)
//        }
        
        let dataObs = RemoteModelImpl.shared.getAllCategoriesFromApi2()
        dataObs
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{ response in
            
            self.categoryList = response.data
            self.mView?.displayCategories(data: self.categoryList)
            
        },onError: { error in
            
            self.mView?.displayError(error: error.localizedDescription)
            
        }).disposed(by: bag)
    }
    
    func attachView(view: PetListView) {
        mView = view
    }
    
    
}
