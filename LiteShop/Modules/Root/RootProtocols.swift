//
//  RootProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import Foundation


struct RootViewModel {
    let title: String
}

protocol RootViewInput: ViewInput {
    func update()
}

protocol RootViewOutput: AnyObject {
    var viewModel: RootViewModel { get }
    
    func onTapLogin()
    func onTapRegister()
}
