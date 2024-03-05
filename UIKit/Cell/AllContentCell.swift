//
//  AllContentCell.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/19.
//

import UIKit
import SnapKit

class AllContentCell: UICollectionViewCell {
    // 数据
    var classificationLevel1Model: AllClassificationLevel1Model? {
        didSet {
            // 传过来就显示
            collectionView.reloadData()
        }
    }
    // 创建闭包
    var showAllStickersDetailBlock: ShowAllStickersDetailBlock?
    
    lazy var collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        // 注意：水平滚动行变列、列变行
        flowlayout.scrollDirection = .horizontal
        flowlayout.minimumLineSpacing = 10
        flowlayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // 注册cell
        collectionView.register(AllCollectionViewCell.self, forCellWithReuseIdentifier: "\(AllCollectionViewCell.self)")
        
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension AllContentCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - collectionView dataSource,delegate
extension AllContentCell: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classificationLevel1Model?.twoCateList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(AllCollectionViewCell.self)", for: indexPath) as? AllCollectionViewCell
        // 赋值
        cell?.classificationLevel2Model = classificationLevel1Model?.twoCateList?[indexPath.item]
        return cell ?? UICollectionViewCell()
    }

    /**
     点击事件触发闭包:
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 闭包点击事件,注意闭包可选
        showAllStickersDetailBlock?(classificationLevel1Model?.twoCateList?[indexPath.item])
    }
}
// MARK: - flowLayoutDelegate
extension AllContentCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
