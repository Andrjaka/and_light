//
//  CartPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CartPresenter: ViewPresenter, ViewContainer, CartViewOutput {
    
    
    
    weak var view: CartViewInput?
    
    let viewModel: CartViewModel
   
    
    init(viewModel: CartViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    func didCheckOut() {
        let controller = viewFactory.createOrderScreen()
        view?.present(viewController: controller)
    }
}

