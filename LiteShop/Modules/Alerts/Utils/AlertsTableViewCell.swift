//
//  AlertsTableViewCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-14.
//

import UIKit

class AlertsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String, description: String) {
        headLabel.text = title
        descriptionLabel.text = description
    }
}
