//
//  AllSectionHeader.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/19.
//

import UIKit
import Then
import SnapKit

class AllSectionHeader: UICollectionReusableView {
    // 数据
    var classificationLevel1Model: AllClassificationLevel1Model? {
        // 赋值
        didSet {
            nameLabel.text = classificationLevel1Model?.name
        }
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = UIColor(0x995B40)
        $0.textAlignment = .left
    }
    let seeAllLabel = UILabel().then {
        $0.text = "See All"
        $0.textColor = UIColor(0xA8958D)
        $0.font = UIFont(name: "Helvetica Neue", size: 14)
        $0.textAlignment = .left
    }
    // UI 61 - 45 = 16
    // 闭包跳转
    let headerBtnView = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}
extension AllSectionHeader {
    /**
     配置UI:
     */
    func configUI() {
        self.addSubview(headerBtnView)
        headerBtnView.addSubview(nameLabel)
        headerBtnView.addSubview(seeAllLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerBtnView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.right.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(22)
            $0.height.equalTo(25)
            $0.bottom.equalToSuperview().offset(-10)
        }
        seeAllLabel.snp.makeConstraints {
            $0.right.equalToSuperview().offset(-13)
            $0.centerY.equalTo(nameLabel.snp.centerY)
        }
    }
}
