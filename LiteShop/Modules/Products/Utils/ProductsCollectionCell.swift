//
//  ProductsCollectionCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-20.
//

import UIKit

class ProductsCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var previewTitleLabel: UILabel!
    
    @IBOutlet weak var previewDescriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var previewImage: UIImageView!
    
    var onRemove: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
        
        
    }
    
//MARK: -Action
    
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.onRemove?()
    }
    
    func configure() {
       addButton.layer.cornerRadius = 10
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        
        
    }
    func set(title: String, description: String, price: Int, image: String, isInCart: Bool) {
        previewTitleLabel.text = title
        previewDescriptionLabel.text = description
        priceLabel.text = "\(price)$"
        if let url = URL(string: image) {
            previewImage.kf.setImage(with: url)
            
        }
        addButton.setTitle(isInCart ? "Remove" : "Add to cart", for: .normal)
    }
    
}
