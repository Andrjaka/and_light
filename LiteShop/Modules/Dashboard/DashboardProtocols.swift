//
//  DashboardProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import Foundation

struct DashboardViewModel {
    let title: String
}

protocol DashboardViewInput: ViewInput {
    func update()
}

protocol DashboardViewOutput: AnyObject {
    var viewModel: DashboardViewModel { get }
    
   
}
