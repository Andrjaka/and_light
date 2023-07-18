//
//  ProfileTableViewCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
 
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func set(option: String) {
        
        optionLabel.text = option
    }
    
}
