//
//  DashboardsPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit

class DashboardPresenter: ViewPresenter, ViewContainer, DashboardViewOutput {
        
    weak var view: DashboardViewInput?
    
    let viewModel: DashboardViewModel
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
    }
    
    
}
