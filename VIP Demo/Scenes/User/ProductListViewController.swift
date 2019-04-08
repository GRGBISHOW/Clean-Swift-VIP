//
//  ProductListViewController.swift
//  VIP Demo
//
//  Created by Gurung Bishow on 1/4/19.
//  Copyright (c) 2019 Gurung Bishow. All rights reserved.


import UIKit
import AlamofireImage
protocol ProductListDisplayLogic: class
{
  func displayUI(viewModel: ProductList.Fetch.ViewModel)
}

class ProductListViewController: UIViewController, ProductListDisplayLogic
{
    
    @IBOutlet weak var productListTableView: UITableView!
    var interactor: ProductListBusinessLogic?
   var router: (NSObjectProtocol & ProductListRoutingLogic & ProductListDataPassing)?
    var productList:[Product] = []
  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = ProductListInteractor()
    let presenter = ProductListPresenter()
    let router = ProductListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    getUserList()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func getUserList()
  {
    interactor?.getUserList()
  }
  
  func displayUI(viewModel: ProductList.Fetch.ViewModel)
  {
    self.productList = viewModel.products ?? []
    self.productListTableView.reloadData()
    
  }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = productList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        cell.nameLabel.text = product.name
        if let url = URL(string: product.imgUrl) {
            cell.productImageVIew.af_setImage(withURL: url)
        }
        cell.priceLabel.text = "\(product.price)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
