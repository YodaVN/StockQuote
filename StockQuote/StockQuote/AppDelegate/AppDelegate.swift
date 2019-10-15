//
//  AppDelegate.swift
//  StockQuote
//
//  Created by Nhan Nguyen on 10/15/19.
//  Copyright © 2019 Nhan Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        let stockListViewController = StockListViewController(nibName: "StockListView", bundle: nil)
        stockListViewController.title = "Stocks"
        
        navController = UINavigationController(rootViewController: stockListViewController)
        navController.navigationBar.prefersLargeTitles = true
        
        window!.rootViewController = navController
        window!.makeKeyAndVisible()
        
        return true
    }
}

