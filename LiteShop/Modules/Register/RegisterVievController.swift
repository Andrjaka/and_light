//
//  RegisterVievController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit

final class RegisterViewController: ViewController, PresenterContainer, RegisterViewInput {

    @IBOutlet
    weak var nameTexField: UITextField!
    
    @IBOutlet
    weak var emailTextField: UITextField!
    
    @IBOutlet
    weak var passwordTextField: UITextField!
    
    @IBOutlet
    weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet
    weak var registerButton: UIButton!
    
    
    var presenter: RegisterViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    
    private func configure() {
        registerButton.layer.cornerRadius = 10
    }
    
    // MARK: ACTION
    
    func warning(type: RegisterInputType) {
        switch type {
            
        case .email:
            emailTextField.shakeUI()
        case .password:
            passwordTextField.shakeUI()
        case .non(let text):
            presentWarning(text: text)
        case .name:
            nameTexField.shakeUI()
        case .confirmPassword:
            confirmPasswordTextField.shakeUI()
        case .all:
            emailTextField.shakeUI()
            passwordTextField.shakeUI()
            nameTexField.shakeUI()
            confirmPasswordTextField.shakeUI()
        }
    }
    func loading(isOn: Bool) {
        registerButton.loadingIndicator(isOn)
    }
    
    @IBAction func ditTapRegister(_ sender: UIButton) {
        presenter.onRegister(name: nameTexField.text, email: emailTextField.text, password: passwordTextField.text, confirmPassword: confirmPasswordTextField.text)
    }
    
    func update() {
        
    }
    
    var viewModel: RegisterViewModel {
        return presenter.viewModel
    }
}
