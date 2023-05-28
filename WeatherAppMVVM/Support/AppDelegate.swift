//
//  AppDelegate.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 17.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let rootViewController = WeatherTodayViewController()
        let navVC = UINavigationController()
        navVC.viewControllers = [rootViewController]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }
}

