//
//  AppDelegate.swift
//  PruebaExamen
//
//  Created by Jose Raul Gastelum Ruiz on 13/06/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigation = UINavigationController()
                window = UIWindow(frame: UIScreen.main.bounds)
                window?.rootViewController = navigation
                window?.makeKeyAndVisible()
                
                let vc = PuebaPlantillaMain.createModule(navigation: navigation)
                navigation.pushViewController(vc, animated: true)
        
        return true
    }

}

