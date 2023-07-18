//
//  ViewFactory.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import UIKit


class ViewFactory: NSObject {
    
    static let shared = ViewFactory()
    
    func createAuthScreen() -> NavigationController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "RootAuthModule") as! NavigationController
        let viewModel = RootViewModel(title: "")
        let presenter = RootPresenter(viewModel: viewModel)
        bind(view: controller.topViewController as! RootViewController, presenter: presenter)
        return controller
    }
    
    func createRegisterScreen() -> RegisterViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: RegisterViewController.self)) as! RegisterViewController
        let viewModel = RegisterViewModel(title: "")
        let presenter = RegisterPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createLoginScreen() -> LoginViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as! LoginViewController
        let viewModel = LoginViewModel(title: "")
        let presenter = LoginPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createDashboardScreen() -> DashboardViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: DashboardViewController.self)) as! DashboardViewController
        let viewModel = DashboardViewModel(title: "")
        let presenter = DashboardPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createProfileScreen() -> ProfileViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) as! ProfileViewController
        let viewModel = ProfileViewModel(title: "")
        let presenter = ProfilePresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func editProfileScreen(onChangeName: ((String?) -> Void)?) -> EditProfileViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: EditProfileViewController.self)) as! EditProfileViewController
        let viewModel = EditProfileViewModel(title: "", onChangeName: onChangeName)
        let presenter = EditProfilePresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createCatalogScreen() -> CatalogViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CatalogViewController.self)) as! CatalogViewController
        let viewModel = CatalogViewModel(title: "")
        let presenter = CatalogPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    func createCartScreen() -> CartViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: CartViewController.self)) as! CartViewController
        let viewModel = CartViewModel(title: "")
        let presenter = CartPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    func createOrderScreen() -> OrderViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: OrderViewController.self)) as! OrderViewController
        let viewModel = OrderViewModel(title: "")
        let presenter = OrderPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    func createAlertsScreen() -> AlertsViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: AlertsViewController.self)) as! AlertsViewController
        let viewModel = AlertsViewModel(title: "")
        let presenter = AlertsPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func createProductsScreen(products: [CategoriesProductStorage]) -> ProductsViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: ProductsViewController.self)) as! ProductsViewController
        let viewModel = ProductsViewModel(title: "", products: products)
        let presenter = ProductsPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    func creatHistoryScreen() -> HistoryViewController {
        let storyboard = UIStoryboard(storyboard: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: HistoryViewController.self)) as! HistoryViewController
        let viewModel = HistoryViewModel(title: "")
        let presenter = HistoryPresenter(viewModel: viewModel)
        bind(view: controller, presenter: presenter)
        return controller
    }
    
    
    func createRootScreen() -> RootTabBarController {
        
        let dashboardController = createDashboardScreen()
        let profileController = createProfileScreen()
        let catalogController = createCatalogScreen()
        let cartController = createCartScreen()
        let alertsController = createAlertsScreen()
        
        let tabViewConteroller = RootTabBarController()
        tabViewConteroller.setViewControllers(
       
            [
                dashboardController,
                catalogController,
                cartController,
                alertsController,
                profileController
    
            ],
            animated: true
        )
        
        let tabBar = tabViewConteroller.tabBar
        
        tabBar.tintColor = UIColor.systemIndigo
        tabBar.unselectedItemTintColor = UIColor.systemGray
        
        let dashboardItem = tabBar.items?[0]
        dashboardItem?.title = "Dashboard"
        dashboardItem?.image = UIImage(systemName: "house.circle")
        
        let profileItem = tabBar.items?[4]
        profileItem?.title = "Profile"
        profileItem?.image = UIImage(systemName: "person.circle")
        
        let catalogItem = tabBar.items?[1]
        catalogItem?.title = "Catalog"
        catalogItem?.image = UIImage(systemName: "folder.circle")
        
        let cartItem = tabBar.items?[2]
        cartItem?.title = "Cart"
        cartItem?.image = UIImage(systemName: "cart.circle")
        let count = CartService.shared.saveItems.count
        cartItem?.badgeValue = count > 0 ? "\(count)" : nil
        
        let alertsItem = tabBar.items?[3]
        alertsItem?.title = "Alerts"
        alertsItem?.image = UIImage(systemName: "bell.circle")
        
        // let cartItem = tabBar.items?[2]
        
        return tabViewConteroller
    }
}
