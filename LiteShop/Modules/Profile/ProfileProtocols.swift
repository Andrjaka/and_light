//
//  ProfileProtocols.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import Foundation


struct ProfileViewModel {
    let title: String
}

protocol ProfileViewInput: ViewInput {
    func update()
    
}

protocol ProfileViewOutput: AnyObject {
    var viewModel: ProfileViewModel { get }
    var options: [ProfilePresenter.Options] {get}
    
    func didSelect(index: Int)
   
}
