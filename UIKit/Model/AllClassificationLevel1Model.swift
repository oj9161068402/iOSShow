//
//  AllClassificationLevel1Model.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/19.
//

import UIKit

// MARK: - 一级分类
class AllClassificationLevel1Model: BaseModel {
    var name: String = ""
    var twoCateList: [AllClassificationModel]?
    // 此id使用string类型
    var sticker_one_cate_id: String = ""
}
