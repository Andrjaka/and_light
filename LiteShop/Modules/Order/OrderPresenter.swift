//
//  OrderPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-11.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class OrderPresenter: ViewPresenter, ViewContainer, OrderViewOutput {
        
    weak var view: OrderViewInput?
    
    let viewModel: OrderViewModel
    
    init(viewModel: OrderViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
    }
    

    func setData(address: String, surname: String, name: String, phone: String, date: String) {
        //        gaunama butinai nuoroda is kur gauti faila
        let ref = Database.database().reference()
        let info = Auth.auth().currentUser
        guard let id = info?.uid else {
            return
        }
        guard let baseId = (name + date + phone).base64Encoded() else { return }
        
        let items = CartService.shared.saveItems.compactMap({ $0.dict }) 
        
        ref.child("orders").child(baseId).setValue([
            "address": address,
            "date": date,
            "id": baseId,
            "isDone": false,
            "name": name,
            "phone": phone,
            "surname": surname,
            "userId": id,
            "products": items
        ])
        
        DispatchQueue.main.async {
            CartService.shared.removeAll()
            self.view?.didFinishOrder(isDone: true)
        }
    }
    
}
extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        var st = self.replacingOccurrences(of: " ", with: "").removeSpecialCharsFromString()
        if (self.count % 4 <= 2){
            st += String(repeating: "=", count: (self.count % 4))
        }
        guard let data = Data(base64Encoded: st) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    func removeSpecialCharsFromString() -> String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-=().!_")
        return self.filter {okayChars.contains($0) }
    }
}
extension Encodable {
    var dict: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
