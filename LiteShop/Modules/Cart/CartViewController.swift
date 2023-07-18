//
//  CartViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit

final class CartViewController: ViewController, PresenterContainer, CartViewInput {


    @IBOutlet weak var cartTableView: UITableView!
    
    
    var presenter: CartViewOutput!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reload()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
    
    }
  
    @objc private func didChangeCart(_ notification: NSNotification) {
        reload()
    }
    
    private func configure() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        if let footer = cartTableView.tableFooterView as? CartFooterView {
            footer.onTap = {
                self.presenter.didCheckOut()
            }
        }
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeCart(_:)), name: NSNotification.Name("cart_changed"), object: nil)
    }
    
    func reload() {
        cartTableView.reloadData()
        if CartService.shared.saveItems.isEmpty {
            cartTableView.tableFooterView?.isHidden = true
        } else {
            cartTableView.tableFooterView?.isHidden = false
        }
    }
    
    
    
    // MARK: ACTION
    
    func update() {
        
    }
    
    var viewModel: CartViewModel {
        return presenter.viewModel
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartService.shared.saveItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartTableCell.self), for: indexPath) as! CartTableCell
        let item = CartService.shared.saveItems[indexPath.row]
        cell.set(title: item.title, price: item.price, image: item.image)
        cell.onRemove = {[weak self] in
            CartService.shared.remove(id: item.id)
            self?.cartTableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}
