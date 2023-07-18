//
//  RootTapBarController.swift
//  LiteShop
//
//  Created by Andrius J on 2023-02-13.
//

import UIKit




final class RootTabBarController: UITabBarController {
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
       
    }
        
    private func configure() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeCart(_:)), name: NSNotification.Name("cart_changed"), object: nil)
        
    }
    @objc private func didChangeCart(_ notification: NSNotification) {
        guard let count = notification.userInfo?["count"] as? Int else { return }
        changeBadge(count: count)
    }
    
    func changeBadge(count: Int) {
        guard let cartController = viewControllers?[2] as? CartViewController else { return }
        cartController.tabBarItem.badgeValue = count > 0 ? "\(count)" : nil
    }
    
}

