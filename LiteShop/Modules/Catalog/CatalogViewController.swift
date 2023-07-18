//
//  CatalogViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit

final class CatalogViewController: ViewController, PresenterContainer, CatalogViewInput {


    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CatalogViewOutput!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    }
    
    private func configure() {
        tableView.delegate =  self
        tableView.dataSource = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: ACTION
    
    func update() {
        
    }
    
    var viewModel: CatalogViewModel {
        return presenter.viewModel
    }
}
extension CatalogViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CatalogTableCell.self), for: indexPath) as! CatalogTableCell
        
        let item = presenter.data[indexPath.row]
        cell.set(title: item.title, image: item.image)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.openCategory(index: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
        
        
    }
    
}
    
    
