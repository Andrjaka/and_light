//
//  DashboardViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-31.
//

import UIKit

final class DashboardViewController: ViewController, PresenterContainer, DashboardViewInput {

    var presenter: DashboardViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    
    private func configure() {
        
    }
    
    // MARK: ACTION
    
    func update() {
        
    }
    
    var viewModel: DashboardViewModel {
        return presenter.viewModel
    }
}
