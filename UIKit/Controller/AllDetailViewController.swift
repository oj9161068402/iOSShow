//
//  AllDetailViewController.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/19.
//

import UIKit
import SnapKit
import Then

class AllDetailViewController: BaseViewController {
    // VC传来的数据
    var classificationLevel1Model: AllClassificationLevel1Model? {
        didSet {
            self.navigationItem.title = classificationLevel1Model?.name
            self.sticker_one_cate_id = classificationLevel1Model?.sticker_one_cate_id
        }
    }
    var sticker_one_cate_id : String?
    
    // 网络请求获取的数据
    var classificationModelList: [AllClassificationModel?]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // UI
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 15
        flowLayout.minimumInteritemSpacing = 13
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        // 设置背景透明
        collectionView.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // 注册
        collectionView.register(AllDetailCollectionViewCell.self, forCellWithReuseIdentifier: "\(AllDetailCollectionViewCell.self)")
        
        return collectionView
    }()
    
    
    let bgImageView = UIImageView().then {
        $0.image = R.image.img_detail_bg()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
        // 数据请求
        requestAllDetailData()
    }
    

}
extension AllDetailViewController {
    
    
    func configUI() {
        refreshNavigationBarBackgroundColor(fontColor: UIColor(0x9F4C3C), font: .systemFont(ofSize: 22, weight: .medium))
        view.addSubview(bgImageView)
        view.addSubview(collectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bgImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(UIDevice.vg_navigationFullHeight())
            $0.left.right.equalToSuperview()
            // 注意底部安全区
            $0.bottom.equalToSuperview().inset(UIDevice.vg_safedistanceBottom())
        }
        
    }
}
// MARK: - 网络请求
extension AllDetailViewController {
    
    /**
     请求接口: classificationLevel2
     */
    func requestAllDetailData() {
        let provider = XRNetwork<HomeNetworkManager>()
        provider.requestDataIsListWithJson(HomeNetworkManager.classificationLevel2(self.sticker_one_cate_id ?? "-1"), type: AllClassificationModel.self, sucess: { (code, msg, list, jsonStr) in
            self.classificationModelList = list
//            print(jsonStr)
        }) { (error) in
            // 请求失败，网络视图
            self.showNetWorkView()
        }
    }
    
    
}


// MARK: - collectionView dadaSource、delegate
extension AllDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classificationModelList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllDetailCollectionViewCell.self)", for: indexPath) as? AllDetailCollectionViewCell
        // 赋值
        cell?.classificationModel = classificationModelList?[indexPath.item]
        return cell ?? UICollectionViewCell()
    }
  
    /**
     点击事件触发贴纸详情页面
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stickersDetailVC = StickersDetailViewController()
        stickersDetailVC.classificationModel = self.classificationModelList?[indexPath.item]
        self.navigationController?.pushViewController(stickersDetailVC, animated: true)
    }
    
    
}

// MARK: - flowLayoutDelegate
extension AllDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 比例大小
        let width = (kScreenW - 32 - 13 * 2) / 3
        
        return CGSize(width: width, height: width * 150 / 106)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // 注意：距离collectionView底部，即距离安全区底部是55
        return UIEdgeInsets(top: (98 - UIDevice.vg_navigationFullHeight()), left: 16, bottom: 55, right: 16)
    }
    
    
    
    
}
