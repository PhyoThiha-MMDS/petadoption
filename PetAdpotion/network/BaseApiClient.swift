//
//  BaseApiClient.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 05/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
let USER_DEF_TOKEN = "ACCESS_TOKEN"
open class BaseApiClient {
    
    fileprivate let BASE_URL = "https://2edd5285-2da8-4bcd-997c-0eb2c4e77da4.mock.pstmn.io/"
    
    /*
     Function For Api With headers
     */
    func requestApiWithHeaders(
        url:String,
        method:HTTPMethod,
        params:Parameters,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
        
    ){
        
        let headers:HTTPHeaders = [
            "Authorization" : "Bearer \(UserDefaults.standard.string(forKey: USER_DEF_TOKEN) ?? "")"
        ]
        
        Alamofire.request(url , method: method , parameters: params , headers: headers)
            .responseJSON{ response in
                
                switch response.result {
                    
                case .success:
                    
                    success(response.data!)
                    
                case .failure(let error):
                    
                    debugPrint(error.localizedDescription)
                    fail(error.localizedDescription)
                }
        }
        
    }
    
    func reuqestApiWithHeaders2<T>(
        url:String,
        method:HTTPMethod,
        params:Parameters,
        value: T.Type
    ) -> Observable<T>  where T : Codable {
        
        let headers: HTTPHeaders = [
            
            "Authorization" : "Bearer \(UserDefaults.standard.string(forKey: "ACCESS_TOKEN") ?? "")",
            "app-id" : "mRksMmN7TH-MeAmaTF2Fz",
            "secret-key" : "86GML5Kz97kygJFQzwt7SpjrZeVXmY9KnU4GkUEn"
        ]
        
        return Observable<T>.create { (observer) -> Disposable in
            
            let request =  Alamofire.request( self.BASE_URL + url , method: method, parameters: params, headers : headers)
                .responseJSON{ response in
                    
                    
                    switch response.result {
                        
                    case .success:
                        
                        if  200 ... 299 ~= response.response?.statusCode ?? 500   {
                            
                            let data = response.data!.seralizeData(for: T.self)
                            
                            observer.onNext(data)
                            observer.onCompleted()
                            
                        }else{
                            
                            let error = response.data!.seralizeData(for: ErrorResponse.self)
                            observer.onError(NSError(domain: error.message ?? "", code: error.code ?? 500, userInfo: nil))
                            
                        }
                        
                    case .failure(let error):
                        
                        observer.onError(error)
                    }
            }
            
            return Disposables.create(with: {
                request.cancel()
            })
            
        }
    }
    
    /*
     Function For Api Without headers
     */
    func reuqestApiWithoutHeaders(
        url:String,
        method:HTTPMethod,
        params:Parameters,
        success: @escaping(Data) -> Void,
        fail: @escaping(String) -> Void
    ){
        
        
        
        Alamofire.request(url , method: method , parameters: params , headers: [:])
            .responseJSON{ response in
                
                switch response.result {
                    
                case .success:
                    
                    success(response.data!)
                    
                case .failure(let error):
                    
                    debugPrint(error.localizedDescription)
                    fail(error.localizedDescription)
                }
        }
        
    }
    
    
    func generateUrl(route:String) -> String {
        return BASE_URL + route
    }
}
