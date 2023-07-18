//
//  CartTableCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-03-27.
//

import UIKit
import Kingfisher

class CartTableCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    @IBOutlet weak var previewNamelabel: UILabel!
    
    @IBOutlet weak var previewPriceLabel: UILabel!
    
    
    var onRemove: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func didTapRemove(_ sender: UIButton) {
        onRemove?()
    }
    func set(title: String, price: Int, image: String) {
        previewNamelabel.text = title
        previewPriceLabel.text = "\(price)$"
        if let url = URL(string: image) {
            previewImageView.kf.setImage(with: url)
            
        }
    }
}
