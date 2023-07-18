//
//  HistoryTableCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-17.
//


import UIKit

class HistoryTableCell: UITableViewCell {
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    func set(title: String, price: String) {
        productTitleLabel.text = title
        productDescriptionLabel.text = price
    }
}
