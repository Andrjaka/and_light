//
//  HistoryViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-17.
//

import UIKit

final class HistoryViewController: ViewController, PresenterContainer, HistoryViewInput {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HistoryViewOutput!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    
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
    
    var viewModel: HistoryViewModel {
        return presenter.viewModel
    }
}
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data[section].products?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryTableCell.self), for: indexPath) as! HistoryTableCell
        if let product = presenter.data[indexPath.section].products?[indexPath.row] {
            cell.set(title: product.title, price: "\(product.price)$")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
