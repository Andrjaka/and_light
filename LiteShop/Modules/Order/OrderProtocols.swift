//
//  OrderProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-11.
//


import Foundation


struct OrderViewModel {
    let title: String
}

protocol OrderViewInput: ViewInput {
    func update()
    func didFinishOrder(isDone: Bool)
}

protocol OrderViewOutput: AnyObject {
    var viewModel: OrderViewModel { get }
    
    func setData(address: String, surname: String, name: String, phone: String, date: String)
}
