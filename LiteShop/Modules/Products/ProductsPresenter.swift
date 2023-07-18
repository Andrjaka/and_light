//
//  ProductsPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-20.
//

import UIKit

class ProductsPresenter: ViewPresenter, ViewContainer, ProductsViewOutput {
        
    weak var view: ProductsViewInput?
    
    let viewModel: ProductsViewModel
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
    }
    
    
}
