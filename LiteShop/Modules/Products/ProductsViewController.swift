//
//  ProductsViewController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-20.
//

import UIKit

final class ProductsViewController: ViewController, PresenterContainer, ProductsViewInput {

    var presenter: ProductsViewOutput!

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        print(viewModel.products)
    
    }
    
    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    // MARK: ACTION


    func update() {
        
    }
    var viewModel: ProductsViewModel {
        return presenter.viewModel
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProductsCollectionCell.self), for: indexPath) as! ProductsCollectionCell
        let item = viewModel.products[indexPath.item]
        cell.set(title: item.title, description: item.description, price: item.price, image: item.image, isInCart: CartService.shared.isContain(id: item.id))
        cell.onRemove = {[weak self] in
            if CartService.shared.isContain(id: item.id) {
                CartService.shared.remove(id: item.id)
            } else {
                CartService.shared.add(item: item)
            }
            self?.collectionView.reloadData()
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = ((UIScreen.main.bounds.width - 48 - 12) / 2) * 1.3
                let width = ((UIScreen.main.bounds.width - 48 - 12) / 2)
                return .init(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 24, bottom: 0, right: 24)
    }
  }



