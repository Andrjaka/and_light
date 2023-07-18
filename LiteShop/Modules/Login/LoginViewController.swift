//
//  LoginViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit

final class LoginViewController: ViewController, PresenterContainer, LoginViewInput {
    
    
    @IBOutlet
    weak var emailTextField: UITextField!
    
    @IBOutlet
    weak var passwordTextField: UITextField!
    
    @IBOutlet
    weak var loginButton: UIButton!
    
    var presenter: LoginViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    private func configure() {
        loginButton.layer.cornerRadius = 10
        
    }
    
    // MARK: ACTION
    
    func warning(type: LoginInputType) {
        switch type {
            
        case .email:
            emailTextField.shakeUI()
        case .password:
            passwordTextField.shakeUI()
        case .all:
            emailTextField.shakeUI()
            passwordTextField.shakeUI()
        case .non(let text):
            presentWarning(text: text)
        }
    }
    func loading(isOn: Bool) {
        loginButton.loadingIndicator(isOn)
    }
    
    @IBAction func ditTapLogin(_ sender: Any) {
        presenter.onLogin(email: emailTextField.text, password: passwordTextField.text)
    }
    
    func update() {
        
    }
    
    var viewModel: LoginViewModel {
        return presenter.viewModel
    }
}
