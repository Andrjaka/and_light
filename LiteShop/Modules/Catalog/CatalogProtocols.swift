//
//  CatalogProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import Foundation


struct CatalogViewModel {
    let title: String
}

protocol CatalogViewInput: ViewInput {
    func update()
    func reloadData()
}

protocol CatalogViewOutput: AnyObject {
    var viewModel: CatalogViewModel { get }
    
    var data: [CategoriesStorage] { get }
    func openCategory(index: Int)
   
}

