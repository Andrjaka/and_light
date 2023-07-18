//
//  CartService.swift
//  LiteShop
//
//  Created by Andrius J on 2023-03-27.
//

import Foundation


class CartService {
    
    private init() {}
    static var shared = CartService()
    let userDefaults = UserDefaults.standard
    private let serviceKey = "json_favorite_item"
    
    
    private(set) var saveItems: [CategoriesProductStorage] {
        set { save(saveItems: newValue) }
        
        get {
            let jsonDecoder = JSONDecoder()
            guard let jsonData = userDefaults.data(forKey: serviceKey),
                  let bookmarks = try? jsonDecoder.decode([CategoriesProductStorage].self, from: jsonData) else { return [] }
            return bookmarks
        }
    }
    
    func add(item: CategoriesProductStorage) {
        var items = saveItems
        items.append(item)
        save(saveItems: items)
    }
    
    func remove(id: Int) {
        var items = saveItems
        items.removeAll(where: {$0.id == id})
        save(saveItems: items)
    }
    
    func isContain(id: Int) -> Bool {
        let items = saveItems
        return items.contains(where: {$0.id == id})
    }
    
    func save(saveItems: [CategoriesProductStorage]) {
        let jsonEncoder = JSONEncoder()
        guard let jsonData = try? jsonEncoder.encode(saveItems) else { return }
        userDefaults.set(jsonData, forKey: serviceKey)
        NotificationCenter.default.post(name: NSNotification.Name("cart_changed"), object: nil, userInfo: ["count": saveItems.count])
    }
    
    func removeAll() {
        userDefaults.removeObject(forKey: serviceKey)
        NotificationCenter.default.post(name: NSNotification.Name("cart_changed"), object: nil, userInfo: ["count": 0])
    }
}


