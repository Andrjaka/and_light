//
//  CatalogTableCell.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-20.
//

import UIKit
import Kingfisher

class CatalogTableCell: UITableViewCell {
    
    
    @IBOutlet
    weak var previewImageView: UIImageView!
    
    @IBOutlet
    weak var previewTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(title: String, image: String) {
        
        previewTitleLabel.text = title
        if let url = URL(string: image) {
            previewImageView.kf.setImage(with: url)
        }
        
    }
    
}
