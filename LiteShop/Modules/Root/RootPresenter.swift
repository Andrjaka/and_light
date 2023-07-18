//
//  RootPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import UIKit

class RootPresenter: ViewPresenter, ViewContainer, RootViewOutput {
        
    weak var view: RootViewInput?
    
    let viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
    }
    
    func onTapLogin() {
        let controller = viewFactory.createLoginScreen()
        view?.push(viewController: controller)
        
    }
    func onTapRegister() {
        let controller = viewFactory.createRegisterScreen()
        view?.push(viewController: controller)
    }
}
