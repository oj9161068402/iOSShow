//
//  BaseViewController.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/9/29.
//

import UIKit
import Rswift
import SwiftUI
import SnapKit

// MARK: - 对UIViewController的继承:统一导航视图
class BaseViewController: UIViewController {

    // 设置self.present是否占满屏幕
//    init() {
//        super.init(nibName:nil,bundle: nil)
//        if #available(iOS 13, *)  {
//             self.modalPresentationStyle = .fullScreen;
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        if #available(iOS 13, *)  {
//             self.modalPresentationStyle = .fullScreen;
//        }
//    }
    
    let emptyView = UIView().then {
        $0.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 更新导航栏颜色
        refreshNavigationBarBackgroundColor(color: UIColor.mainColor)
    }
    

    
}

// MARK: - UI布局
extension BaseViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    func showNetWorkView() {
        // 在原来基础上加个view,emptyView可以做很多东西
        view.bringSubviewToFront(emptyView)
        /**
         自定义emptyView:
         */
    }
    

    
}

// MARK: - 导航栏
extension BaseViewController {
    // MARK: - 设置导航栏背景颜色、字体颜色、字体
    func refreshNavigationBarBackgroundColor(color: UIColor = .clear, fontColor: UIColor = UIColor(0xFFFFFF), font: UIFont = .systemFont(ofSize: 26, weight: .semibold)) {
        let appearance = UINavigationBarAppearance.init()
        appearance.configureWithOpaqueBackground()
        // 背景颜色
        appearance.backgroundColor = color
        
        // 设置导航栏是否有阴影
        appearance.shadowImage = UIImage()
        appearance.shadowColor = UIColor.clear
        
        // 设置导航栏标题属性,中粗体
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: fontColor, NSAttributedString.Key.font: font]
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        // isTranslucent默认为true
//        self.navigationController?.navigationBar.isTranslucent
    }
    
    // MARK: - 自定义导航栏返回按钮
    override func rt_customBackItem(withTarget target: Any!, action: Selector!) -> UIBarButtonItem! {
        return UIBarButtonItem(image: R.image.img_icon_back()?.withRenderingMode(.alwaysOriginal), style: .done, target: target, action: action)
    }
    
}


