//
//  AppDelegate.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/9/28.
//

import UIKit
import RTRootNavigationController

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        setRootVC()
        
        return true
    }


}

extension AppDelegate {
    
    // 设置导航根视图以及window根视图
    func setRootVC() {
        
        let baseTabBarVC = BaseTabBarController()
        
        let rootNavVC = RTRootNavigationController(rootViewControllerNoWrapping: baseTabBarVC)
        
        rootNavVC?.useSystemBackBarButtonItem = false
        rootNavVC?.transferNavigationBarAttributes = false
        
        self.window?.rootViewController = rootNavVC
        
    }
    
    
}
