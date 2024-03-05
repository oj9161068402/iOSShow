//
//  PreviewWrapper.swift
//  SwiftUILearning
//
//  Created by nge0131 on 2023/8/26.
//

import SwiftUI
import UIKit

// MARK: - SwiftUI封装预览UIViewController
struct UIViewControllerPreviewWrapper<T: UIViewController>: UIViewControllerRepresentable {
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T) {
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
}

// MARK: - swiftUI封装预览UIView
struct UIViewPreviewWrapper<T: UIView>: UIViewRepresentable {
    let view: T
    
    init(_ viewBuilder: @escaping () -> T) {
        self.view = viewBuilder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        return self.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

// MARK: - 预览调用 测试
struct PreviewWrapper_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreviewWrapper {
            let controller = UIViewController()
            return controller
        }
    }
}
