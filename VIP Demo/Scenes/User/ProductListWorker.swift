//
//  ProductListWorker.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 1/4/19.
//  Copyright (c) 2019 Gurung Bishow. All rights reserved.


import UIKit
import Alamofire
class ProductListWorker
{
    func getUser(completionHandler:@escaping ([Product]?, Error?) -> Void){
        Alamofire.request("http://my-json-server.typicode.com/grgbishow/fake-server/comments").responseData { (response) in
            switch response.result {
            case .success(let value):
                
                do {
                    let responseModel = try JSONDecoder().decode([Product].self, from: value)
                    completionHandler(responseModel, nil)
                } catch let err {
                    completionHandler(nil, err)
                }
            case .failure(let err):
                completionHandler(nil, err)
            }
        }
        
    }
}
