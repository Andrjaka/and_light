//
//  LoginProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import Foundation

enum LoginInputType {
    case email
    case password
    case all
    case non(String)
}

struct LoginViewModel {
    let title: String
}

protocol LoginViewInput: ViewInput {
    func update()
    func warning(type: LoginInputType)
    func loading(isOn: Bool)
    
}

protocol LoginViewOutput: AnyObject {
    var viewModel: LoginViewModel { get }
    func onLogin(email: String?, password: String?)
   
}
