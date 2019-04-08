//
//  ProductListPresenter.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 1/4/19.
//  Copyright (c) 2019 Gurung Bishow. All rights reserved.


import UIKit

protocol ProductListPresentationLogic
{
  func displayList(response: ProductList.Fetch.Response)
}

class ProductListPresenter: ProductListPresentationLogic
{
  weak var viewController: ProductListDisplayLogic?
  
  // MARK: Do something
  
  func displayList(response: ProductList.Fetch.Response)
  {
    let viewModel = ProductList.Fetch.ViewModel(products: response.products, errorMessage: response.errorMessage)
    viewController?.displayUI(viewModel: viewModel)
  }
}
