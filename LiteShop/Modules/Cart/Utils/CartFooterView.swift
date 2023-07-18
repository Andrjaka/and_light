//
//  CartFooterView.swift
//  LiteShop
//
//  Created by Andrius J on 2023-04-11.
//

import UIKit


final class CartFooterView: UIView {
    
    var onTap: (() -> Void)?

    
    @IBOutlet weak var checkOut: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure()
    }
    
    func configure() {
        checkOut.layer.cornerRadius = 10
        
    }
    
    @IBAction func didTap() {
        onTap?()
        
    }
    
}
