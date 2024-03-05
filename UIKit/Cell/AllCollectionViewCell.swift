//
//  AllCollectionViewCell.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/20.
//

import UIKit
import SnapKit
import Then
import Kingfisher
import Rswift

class AllCollectionViewCell: UICollectionViewCell {
    // 传来数据
    var classificationLevel2Model: AllClassificationModel? {
        didSet {
            // url更新视图
            let imageUrlStr = UrlHost + (classificationLevel2Model?.img_url ?? "")
            let imageUrl = URL(string: imageUrlStr)
            imageView.kf.setImage(with: imageUrl)
        }
    }
    
    // 后续有可能会加会员图表等
    let imageView = UIImageView().then {
        $0.clipsToBounds = true
    }
    let vipImageView = UIImageView().then {
        $0.backgroundColor = .clear
        // 判断是否会员vip
        $0.image = R.image.img_icon_vip3()
    }
    
    let shadowView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension AllCollectionViewCell {
    func configUI() {
        contentView.addSubview(shadowView)
        shadowView.addSubview(imageView)
        imageView.addSubview(vipImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        vipImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview()
        }
    }
}
