//
//  BaseTabBarController.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/9/28.
//

import UIKit
import Then
import RTRootNavigationController
import SnapKit

// MARK: - tabBarController 添加tabItem的NavVC
class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTabBarUI()
        // tabBarItem有对象，可创建新的旧的回收，也可以设置旧对象的属性
        let homeVC = HomeViewController()
        // 修改图片渲染模式为原型 withRenderingMode()
        homeVC.tabBarItem.title = "home"
        homeVC.tabBarItem.image = R.image.tabbar_home()?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem.selectedImage = R.image.tabbar_home_pre()?.withRenderingMode(.alwaysOriginal)
        // tabBarItem有对应它的 容器导航控制器
        let homeNavVC = RTContainerNavigationController(rootViewController: homeVC)
        
        let allVC = AllViewController()
        allVC.tabBarItem = UITabBarItem(title: "all", image: R.image.tabbar_all()?.withRenderingMode(.alwaysOriginal), selectedImage: R.image.tabbar_all_pre()?.withRenderingMode(.alwaysOriginal))
        let allNavVC = RTContainerNavigationController(rootViewController: allVC)
        
        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(title: "setting", image: R.image.tabbar_setting()?.withRenderingMode(.alwaysOriginal), selectedImage: R.image.tabbar_setting_pre()?.withRenderingMode(.alwaysOriginal))
        let settingNavVC = RTContainerNavigationController(rootViewController: settingVC)
        
        // 注意：添加NavVC到viewControllers里
        self.viewControllers = [homeNavVC, allNavVC, settingNavVC]
    }
    

    
}

extension BaseTabBarController {
    // MARK: - 配置tabBar的显示属性
    func refreshTabBarUI() {
        self.tabBar.backgroundColor = .white
        // 选中字体风格颜色
        self.tabBar.tintColor = UIColor(0xBE5945)
    }
}
