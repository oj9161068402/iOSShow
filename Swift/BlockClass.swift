//
//  AllContentCell.swift
//  EmojiMarket
//
//  Created by nge0131 on 2022/10/19.
//

import UIKit
import SnapKit

class BlockClass {
    // 定义闭包
    var showAllStickersDetailBlock: ShowAllStickersDetailBlock?

    typelias ShowAllStickersDetailBlock = (String) -> Void
}

// MARK: - collectionView dataSource,delegate
extension BlockClass {
    /**
     点击事件触发闭包:
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 闭包点击事件,注意闭包可选
        showAllStickersDetailBlock?(classificationLevel1Model?.twoCateList?[indexPath.item])
    }
}