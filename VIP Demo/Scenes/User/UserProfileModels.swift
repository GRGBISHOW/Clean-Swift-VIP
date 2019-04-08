//
//  ProductListModelModels.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 7/4/19.
//  Copyright (c) 2019 Gurung Bishow. All rights reserved.


import UIKit

enum ProductList
{
    enum Fetch
    {
        struct Response
        {
            var products: [Product]?
            var errorMessage:String?
        }
        struct ViewModel
        {
            var products:[Product]?
            var errorMessage:String?
        }
    }
}
