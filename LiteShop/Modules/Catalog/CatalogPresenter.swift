//
//  CatalogPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import CodableFirebase

struct CategoriesStorage: Decodable {
    
    let title: String
    let id: Int
    let image: String
    let products: [CategoriesProductStorage]

}
struct CategoriesProductStorage: Codable {
    
    let title: String
    let description: String
    let id: Int
    let image: String
    let price: Int
    
    
    
}

class CatalogPresenter: ViewPresenter, ViewContainer, CatalogViewOutput {
    
    let ref = Database.database().reference()
    
    weak var view: CatalogViewInput?
    
    let viewModel: CatalogViewModel
    
    var data: [CategoriesStorage] = []
    
    init(viewModel: CatalogViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
        getData()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    func getData() {
        
        
        ref.child("categories").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription ?? "nil")
                return
            }
            let model = try? FirebaseDecoder().decode([CategoriesStorage].self, from: snapshot?.value!)

            
            DispatchQueue.main.async {
                self.data = model ?? []
                self.view?.reloadData()
            }
            
        }
    }
    
    func openCategory(index: Int) {
        let category = data[index]
        let controller = viewFactory.createProductsScreen(products: category.products)
        view?.present(viewController: controller)
    }
}
