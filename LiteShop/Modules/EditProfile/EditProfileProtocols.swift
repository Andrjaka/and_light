//
//  EditProfileProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-04.
//

import Foundation

struct EditProfileViewModel {
    let title: String
    let onChangeName: ((String?) -> Void)?
}

protocol EditProfileViewInput: ViewInput {
    func update()
}

protocol EditProfileViewOutput: AnyObject {
    var viewModel: EditProfileViewModel { get }
    
    func didChangeName(text: String?) 
    
    
}
