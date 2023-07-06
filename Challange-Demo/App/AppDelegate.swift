//
//  AppDelegate.swift
//  Challange-Demo
//
//  Created by Burak Nurçiçek on 11.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        window.makeKeyAndVisible()
        return true
    }
}

