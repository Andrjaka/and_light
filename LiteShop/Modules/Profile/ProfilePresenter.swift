//
//  ProfilePresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfilePresenter: ViewPresenter, ViewContainer, ProfileViewOutput {
    
    var options: [ProfilePresenter.Options] = ProfilePresenter.Options.allCases
    
    weak var view: ProfileViewInput?
    
    let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    func didSelect(index: Int) {
        let option = options[index]
        switch option {
        case.edit:
            let controller = viewFactory.editProfileScreen(onChangeName: { text in
                print(text)
            })
            view?.present(viewController: controller)
        case .orders:
            let controller = viewFactory.creatHistoryScreen()
            view?.present(viewController: controller)
        case.logout:
            
            if let _ = try? Auth.auth().signOut() {
                (UIApplication.shared.delegate as? AppDelegate)?.restoreSession(isWindow: false)
            }
        }
    }
}
extension ProfilePresenter {
    enum Options: CaseIterable {
        case edit
        case orders
        case logout
        var title: String {
            switch self {
                
            case .edit:
                return "Edit"
            case .orders:
                return "My orders"
            case .logout:
                return "Logout"
            }
        }
    }
}

