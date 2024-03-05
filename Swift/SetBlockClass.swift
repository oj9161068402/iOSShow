
import UIKit
import SnapKit


// UIKit
class SetBlockClass {
    var blockClass: BlockClass?

    func setBlock() {

    // 闭包声明
        blockClass?.showAllStickersDetailBlock = { [weak self] model in
            let detailVC = AllDetailViewController()
            detailVC.classificationLevel1Model = model
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

}