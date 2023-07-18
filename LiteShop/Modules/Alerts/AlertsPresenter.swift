//
//  AlertsPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import CodableFirebase

struct AlertsStorage: Decodable {
    
    let title: String
    let description: String
}

class AlertsPresenter: ViewPresenter, ViewContainer, AlertsViewOutput {
    
    let ref = Database.database().reference()
    
    var data: [AlertsStorage] = []
    
    weak var view: AlertsViewInput?
    
    let viewModel: AlertsViewModel
    
    init(viewModel: AlertsViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
      
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    
    func getData() {
        //        gaunama butinai nuoroda is kur gauti faila
        
        ref.child("alerts").getData { error, snapshot in
            guard error == nil else {
                print(error?.localizedDescription ?? "nil")
                return
            }
            let model = try? FirebaseDecoder().decode([AlertsStorage].self, from: snapshot?.value!)
//            let alerts = (snapshot?.value as? [[String: Any]] ?? [])
            
            DispatchQueue.main.async {
                self.data = model ?? []
                self.view?.reloadData()
            }
            
        }
    }
}
