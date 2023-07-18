//
//  RegisterProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import Foundation

enum RegisterInputType {
    case email
    case password
    case all
    case non(String)
    case name
    case confirmPassword
}

struct RegisterViewModel {
    let title: String
}

protocol RegisterViewInput: ViewInput {
    func update()
    func warning(type: RegisterInputType)
    func loading(isOn: Bool)
}

protocol RegisterViewOutput: AnyObject {
    var viewModel: RegisterViewModel { get }
    func onRegister(name: String?, email: String?, password: String?, confirmPassword: String?) 
   
}
