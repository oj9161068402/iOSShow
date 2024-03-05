//
//  AllViewController.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/9/29.
//

import UIKit
import Then
import SnapKit

class AllViewController: BaseViewController {
    var classificationLevel1ModelList: [AllClassificationLevel1Model?]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        // 垂直滚动，子集水平滚动
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        // 配置collectionView,默认优先内部交互
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // 注册sectionHeader
        collectionView.register(AllSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(AllSectionHeader.self)")
        // 注册cell
        collectionView.register(AllContentCell.self, forCellWithReuseIdentifier: "\(AllContentCell.self)")
        
        collectionView.backgroundColor = UIColor(0xFFFFFF)
        collectionView.layer.cornerRadius = 17
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        // 没有刷新
        configData()
    }
    
}
extension AllViewController {
    func configUI() {
        self.view.backgroundColor = UIColor.mainColor
        // 配置标题
        self.navigationItem.title = "ALL"
        // 导航栏不隐藏
        self.navigationController?.isNavigationBarHidden = false
        view.addSubview(collectionView)
    }
    func configData() {
        requestAllData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(UIDevice.vg_navigationFullHeight())
        }
    }
}

// MARK: - 网络相关
extension AllViewController {
    /**
     接口: classficationlevel1
     */
    func requestAllData() {
        let provider = XRNetwork<HomeNetworkManager>()
        provider.requestDataIsListWithJson(HomeNetworkManager.classificationLevel1, type: AllClassificationLevel1Model.self, sucess: {(code, msg, list, jsonStr) in
            // 赋值
            self.classificationLevel1ModelList = list
//            print(jsonStr)
        }) { (error) in
            self.showNetWorkView()
            
        }
    }
    
}

// MARK: - collectionView dataSource,delegate
extension AllViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 数据变量值
        return classificationLevel1ModelList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllContentCell.self)", for: indexPath) as? AllContentCell
        // 赋值
        cell?.classificationLevel1Model = classificationLevel1ModelList?[indexPath.section]
        cell?.showAllStickersDetailBlock = {
            [weak self] (classificationModel) in
            let stickersDetailVC = StickersDetailViewController()
            // 赋值
            stickersDetailVC.classificationModel = classificationModel
            // 跳转
            self?.navigationController?.pushViewController(stickersDetailVC, animated: true)
        }
        return cell ?? UICollectionViewCell()
    }
    
    // sectionHeader
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(AllSectionHeader.self)", for: indexPath) as? AllSectionHeader
        // model赋值
        headerView?.classificationLevel1Model = classificationLevel1ModelList?[indexPath.section]
        // 闭包跳转到 分类详情页面
        headerView?.headerBtnView.addClickAction { [weak self] _ in
            // 设置信息
            // 传参数后续net请求
            let allDetailVC = AllDetailViewController()
            allDetailVC.classificationLevel1Model = headerView?.classificationLevel1Model
            self?.navigationController?.pushViewController(allDetailVC, animated: true)
        }
        return headerView ?? UICollectionReusableView()
    }
}

// MARK: - collectionView flowLayoutDelegate
extension AllViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 只有一项cell
        return CGSize(width: kScreenW, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // section之间的cell的间距就是header大小
        return CGSize(width: kScreenW, height: 61)
    }
    
}
