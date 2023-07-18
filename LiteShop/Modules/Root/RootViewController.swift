//
//  RootViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import UIKit

final class RootViewController: ViewController, PresenterContainer, RootViewInput {

    var presenter: RootViewOutput!

    @IBOutlet
    weak var loginButton: UIButton!
    
    @IBOutlet
    weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    
    private func configure() {
        loginButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
    }
    
    // MARK: ACTION

    @IBAction
    func didTapLoginButton(_ sender: UIButton) {
        presenter.onTapLogin()
    }
    
    @IBAction
    func didTapRegisterButton(_ sender: UIButton) {
        presenter.onTapRegister()
    }
    
    func update() {
        
    }
    
    var viewModel: RootViewModel {
        return presenter.viewModel
    }
}
