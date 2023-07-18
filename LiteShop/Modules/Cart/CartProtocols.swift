//
//  CartProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import Foundation


struct CartViewModel {
    let title: String
}

protocol CartViewInput: ViewInput {
    func update()
    
}

protocol CartViewOutput: AnyObject {
    var viewModel: CartViewModel { get }
    
    func didCheckOut()
   
   
}

