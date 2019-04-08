//
//  ProductListInteractor.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 1/4/19.
//  Copyright (c) 2019 Gurung Bishow. All rights reserved.


import UIKit

protocol ProductListBusinessLogic
{
    func getUserList()
}

protocol ProductListDataStore
{
    //var name: String { get set }
}

class ProductListInteractor: ProductListBusinessLogic, ProductListDataStore
{
    var presenter: ProductListPresentationLogic?
    var worker: ProductListWorker?
    
    func getUserList()
    {
        worker = ProductListWorker()
        worker?.getUser(completionHandler: {[weak self] (data, err) in
            
            let response = ProductList.Fetch.Response(products: data, errorMessage: err?.localizedDescription)
            self?.presenter?.displayList(response: response)
            
        })
        
        
    }
}
