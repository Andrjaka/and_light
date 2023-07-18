//
//  HistoryProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-17.
//

import Foundation

struct HistoryViewModel {
    let title: String
}

protocol HistoryViewInput: ViewInput {
    func update()
    func reloadData()
}

protocol HistoryViewOutput: AnyObject {
    var viewModel: HistoryViewModel { get }
    
    var data: [HistoryStorage] { get }
    
}
