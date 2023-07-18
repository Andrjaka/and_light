//
//  EditProfileViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-04.
//

import UIKit

final class EditProfileViewController: ViewController, PresenterContainer, EditProfileViewInput {

    var presenter: EditProfileViewOutput!

    @IBOutlet weak var changeProofileLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var changeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        changeButton.layer.cornerRadius = 10
    }
    
    @IBAction func didTapChangeButton(_ sender: UIButton) {
        
        
        presenter.didChangeName(text: nameTextField.text)
    }
    
    
    private func configure() {
       
    }
    
    // MARK: ACTION


    
    func update() {
        
    }
    
    
    
    var viewModel: EditProfileViewModel {
        return presenter.viewModel
    }
}

