//
//  RegisterPresenter.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RegisterPresenter: ViewPresenter, ViewContainer, RegisterViewOutput {
        
    weak var view: RegisterViewInput?
    
    let viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
    }
            
    func appear() {
        view?.update()
    }
    
    func loadData(completion: VoidClosure?) {
    }
    
    func onRegister(name: String?, email: String?, password: String?, confirmPassword: String?) {
        guard let name = name, !name.isEmpty else {
            view?.warning(type: .name)
            return
            
        }
        guard ApplicationValidateService.shared.isContainsDigitOrSpecialSymb(string: name) else {
            view?.warning(type: .name)
            return
            
        }
        guard let password = password, !password.isEmpty else {
            view?.warning(type: .password)
            return
            
        }
        guard let confirmPassword = confirmPassword, !confirmPassword.isEmpty else {
            view?.warning(type: .confirmPassword)
            return
            
        }
        guard let email = email, !email.isEmpty else {
            view?.warning(type: .email)
            return
            
        }
        guard ApplicationValidateService.shared.validate(email: email) else {
            view?.warning(type: .email)
            return
            
        }
        guard ApplicationValidateService.shared.isEqualStrings(string1: password, string2: confirmPassword) else {
            view?.warning(type: .password)
            view?.warning(type: .confirmPassword)
            return
            
        
        }
        
        register(email: email, password: password, name: name)
        view?.loading(isOn: true)
    }
    
    private func register(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as? NSError {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.view?.loading(isOn: false)
                    self.view?.warning(type: .non("Login failed"))
                }
                return
            } else {
                let info = Auth.auth().currentUser
                self.setData(email: email, id: info?.uid ?? UUID().uuidString, name: name)
            }
        }
    }
    
    private func setData(email: String, id: String, name: String) {
        //        gaunama butinai nuoroda is kur gauti faila
        let ref = Database.database().reference()
        ref.child("users").child(id).setValue(["email": email, "name": name])
        
        DispatchQueue.main.async {
            self.view?.loading(isOn: false)
            let controller = self.viewFactory.createRootScreen()
            self.view?.push(viewController: controller)
        }
    }
    
}
