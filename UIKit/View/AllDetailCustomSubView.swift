//
//  AllDetailCustomSubView.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/21.
//

import UIKit
import SnapKit
import Then

// MARK: - 分类详情页每一类自定义样式
class AllDetailCustomSubView: UIView {
    
    
    // 5个样式
    let vipImageView = UIImageView().then {
        $0.backgroundColor = .clear
        $0.image = R.image.img_icon_vip3()
    }
    let likeNumLabel = UILabel().then {
        $0.font = UIFont(name: "Arial", size: 10)
        $0.textColor = UIColor(0xA5A5A5)
        $0.textAlignment = .left
    }
    let likeButton = UIButton().then {
        $0.setBackgroundImage(R.image.img_icon_like2(), for: .normal)
    }
    let stickerImageView = UIImageView().then {
        $0.backgroundColor = .clear
    }
    
    let stickerNameLabel = UILabel().then {
        $0.font = UIFont(name: "Arial", size: 12)
        $0.textColor = UIColor(0x4D4D4D)
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AllDetailCustomSubView {
    func configUI() {
        // 判断是否会员
        self.addSubview(vipImageView)
        
        self.addSubview(likeNumLabel)
        self.addSubview(likeButton)
        self.addSubview(stickerImageView)
        self.addSubview(stickerNameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        vipImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview()
        }
        likeNumLabel.snp.makeConstraints {
            $0.top.equalTo(8)
            $0.right.equalTo(likeButton.snp.left).offset(-4)
        }
        likeButton.snp.makeConstraints {
            $0.centerY.equalTo(likeNumLabel.snp.centerY)
            $0.right.equalToSuperview().inset(3)
        }
        stickerImageView.snp.makeConstraints {
            // 图片固定大小
            $0.left.right.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(stickerImageView.snp.width)
        }
        stickerNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
}
