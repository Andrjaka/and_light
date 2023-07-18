//
//  AlertsProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import Foundation


struct AlertsViewModel {
    let title: String
}

protocol AlertsViewInput: ViewInput {
    func update()
    func reloadData()
}

protocol AlertsViewOutput: AnyObject {
    var viewModel: AlertsViewModel { get }
    func getData()
    
    var data: [AlertsStorage] { get }
   
}

