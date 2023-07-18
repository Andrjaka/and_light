//
//  OrderViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-11.
//

import UIKit

final class OrderViewController: ViewController, PresenterContainer, OrderViewInput {
    
    @IBOutlet weak var userInfoLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var presenter: OrderViewOutput!
    private var dateFormater: DateFormatter = {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.YYYY hh:mm"
        return formater
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    
    private func configure() {
        nameTextField.returnKeyType = .done
        nameTextField.delegate = self
        surnameTextField.returnKeyType = .done
        surnameTextField.delegate = self
        phoneTextField.returnKeyType = .done
        phoneTextField.delegate = self
        addressTextField.returnKeyType = .done
        addressTextField.delegate = self
        
    }
    func didFinishOrder(isDone: Bool) {
        print(isDone)
        self.dismiss()
    }
    
    // MARK: ACTION
    
    @IBAction func didTapConfirm(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        guard let surname = surnameTextField.text, !surname.isEmpty else {
            return
        }
        guard let phone = phoneTextField.text, !phone.isEmpty else {
            return
        }
        guard let address = addressTextField.text, !address.isEmpty else {
            return
        }
        let date = dateFormater.string(from: Date())
        presenter.setData(address: address, surname: surname, name: name, phone: phone, date: date)
    }
    
    func update() {
        
    }
        var viewModel: OrderViewModel {
        return presenter.viewModel
    }
}
extension OrderViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
