//
//  ProductsProtocol.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-20.
//

import Foundation


struct ProductsViewModel {
    let title: String
    let products: [CategoriesProductStorage]
}

protocol ProductsViewInput: ViewInput {
    func update()
}

protocol ProductsViewOutput: AnyObject {
    var viewModel: ProductsViewModel { get }
    
    
}
