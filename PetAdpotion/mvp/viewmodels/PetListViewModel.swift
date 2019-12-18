//
//  PetListViewModel.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 09/11/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class PetListViewModel: BaseViewModel {
    
    public var isLoadingObs:BehaviorRelay<Bool> = BehaviorRelay(value: false)
    public var _errorObs:BehaviorRelay<String?> = BehaviorRelay(value: nil)
    let apiService = SharedApiClient.shared
    public var dataObs:PublishSubject<[CategoryVO]> = PublishSubject()
    public var catsObs:PublishSubject<[CatsVO]> = PublishSubject()
    
    let bag = DisposeBag()
    
    override init() {}
    
    public func requestData(){
        
        isLoadingObs.accept(true)
        apiService
            .getAllCategoriesRx()
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{ response in
                
                
                self.dataObs.onNext(response.data)
                
            },onError: { error in
                
                self.isLoadingObs.accept(false)
                self._errorObs.accept(error.localizedDescription)
                
            }).disposed(by: bag)
        
        apiService
            .getAllCats()
            .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
            .subscribe(onNext:{ response in
                
                self.isLoadingObs.accept(false)
                self.catsObs.onNext(response.data)
                
            },onError: {error in
                
                self.isLoadingObs.accept(false)
                self._errorObs.accept(error.localizedDescription)
                
            }).disposed(by: bag)
        
        
    }
}
