//
//  HistoryPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-17.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import CodableFirebase

struct HistoryStorage: Decodable {
    
 
    let userId: String?
    let products: [CategoriesProductStorage]?

}

class HistoryPresenter: ViewPresenter, ViewContainer, HistoryViewOutput {
        
    weak var view: HistoryViewInput?
    
    let viewModel: HistoryViewModel
    let ref = Database.database().reference()
    
    var data: [HistoryStorage] = []
    
    init(viewModel: HistoryViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
        getData()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    func getData() {
        
        
        ref.child("orders").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription ?? "nil")
                return
            }

            let dict = snapshot?.value as? [String: [String: Any]] ?? [:]
            for item in dict {
                let model = try? FirebaseDecoder().decode(HistoryStorage.self, from: item.value)
                if let model = model {
                    self.data.append(model)
                }
            }
            
            print(dict)
            
            DispatchQueue.main.async {
//                self.data = model ?? []
                self.view?.reloadData()
                
            }
            
        }
    }
    
}
