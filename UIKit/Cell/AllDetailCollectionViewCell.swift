//
//  AllDetailCollectionViewCell.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/21.
//

import UIKit
import Then
import SnapKit
import Kingfisher

class AllDetailCollectionViewCell: UICollectionViewCell {
    
    // 数据
    var classificationModel: AllClassificationModel? {
        didSet {
            allDetailCustomSubView.likeNumLabel.text = "\(classificationModel?.like_num ?? 0)"
            allDetailCustomSubView.stickerNameLabel.text = classificationModel?.name
            let stickerImageUrlStr = UrlHost + (classificationModel?.img_url ?? "")
            let stickerImageUrl = URL(string: stickerImageUrlStr)
            allDetailCustomSubView.stickerImageView.kf.setImage(with: stickerImageUrl)
        }
    }
    
    // UI
    let shadowView = UIView().then {
        $0.backgroundColor = .clear
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor(0x000000).withAlphaComponent(0.15).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.cornerRadius = 10
    }
    
    let allDetailCustomSubView = AllDetailCustomSubView().then {
        // 布局有冲突,设置为true
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(0xFFFFFF)
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension AllDetailCollectionViewCell {
    func configUI() {
        self.clipsToBounds = false
        contentView.clipsToBounds = false
        // insertSubview
        // 注意：在belowSubView下面，belowSubView要先单独加上子视图
        contentView.addSubview(shadowView)
        shadowView.addSubview(allDetailCustomSubView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        allDetailCustomSubView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
}
