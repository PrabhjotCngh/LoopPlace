//
//  AppDelegate.swift
//  LoopPlace
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupRootViewController()
        return true
    }
    
    
    private func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let welcomeVC = WelcomeScreenViewController() as UIViewController
        let navigationController = UINavigationController(rootViewController: welcomeVC)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

