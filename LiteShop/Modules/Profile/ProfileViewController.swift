//
//  ProfileViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//


import UIKit

final class ProfileViewController: ViewController, PresenterContainer, ProfileViewInput {

    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: ProfileViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: ACTION
    
    func update() {
        
    }
    
    var viewModel: ProfileViewModel {
        return presenter.viewModel
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.options.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileTableViewCell.self), for: indexPath) as! ProfileTableViewCell
        cell.set(option: presenter.options[indexPath.row].title)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(index: indexPath.row)
    }
    
    
}
