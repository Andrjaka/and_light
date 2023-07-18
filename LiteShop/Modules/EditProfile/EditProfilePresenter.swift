//
//  EditProfilePresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-04.
//

import UIKit

class EditProfilePresenter: ViewPresenter, ViewContainer, EditProfileViewOutput {
        
    weak var view: EditProfileViewInput?
    
    let viewModel: EditProfileViewModel
    
    init(viewModel: EditProfileViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    
    func didChangeName(text: String?) {
        viewModel.onChangeName?(text)
        view?.dismiss(completion: nil)
    }
}
