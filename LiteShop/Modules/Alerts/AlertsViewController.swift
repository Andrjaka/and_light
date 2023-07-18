//
//  AlertsViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit

final class AlertsViewController: ViewController, PresenterContainer, AlertsViewInput {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: AlertsViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        presenter.getData()
        
    }
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
   func reloadData() {
        tableView.reloadData()
    }
    
    
    // MARK: ACTION
    
    func update() {
        
    }
    
    var viewModel: AlertsViewModel {
        return presenter.viewModel
    }
}
extension AlertsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlertsTableViewCell.self), for: indexPath) as! AlertsTableViewCell
        let item = presenter.data[indexPath.row]
        cell.set(title: item.title, description: item.description)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
