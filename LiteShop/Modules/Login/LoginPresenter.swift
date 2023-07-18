//
//  LoginPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class LoginPresenter: ViewPresenter, ViewContainer, LoginViewOutput {
        
    weak var view: LoginViewInput?
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
        
    }
    func onLogin(email: String?, password: String?) {
        guard let email = email, !email.isEmpty else {
            view?.warning(type: .email)
            return
            
        }
        guard ApplicationValidateService.shared.validate(email: email) else {
            view?.warning(type: .email)
            return
            
        }
        
        guard let password = password, !password.isEmpty else {
            view?.warning(type: .password)
            return
            
        }
        
        login(email: email, password: password)
        view?.loading(isOn: true)
    }
    
    
    private func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error as? NSError {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.view?.loading(isOn: false)
                    self.view?.warning(type: .non("Login failed"))
                }
                return
            } else {
                let info = Auth.auth().currentUser
                print(info)
                
                
                DispatchQueue.main.async {
                    self.view?.loading(isOn: false)
                    let controller = self.viewFactory.createRootScreen()
                    self.view?.push(viewController: controller)
                }
            }
        }
    }
    
    
}
