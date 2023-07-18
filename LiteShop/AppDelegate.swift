//
//  AppDelegate.swift
//  LiteShop
//
//  Created by Andrius J on 2023-01-30.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        restoreSession()
        
        return true
    }
    
    func restoreSession(isWindow: Bool = true) {
        if isWindow {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
        if let _ = Auth.auth().currentUser?.uid  {
            window?.rootViewController = ViewFactory.shared.createRootScreen()
        } else {
            window?.rootViewController = ViewFactory.shared.createAuthScreen()
        }
        
    }
    
}

