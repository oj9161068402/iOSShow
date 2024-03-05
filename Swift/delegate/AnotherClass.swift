class UIViewController: UITableViewDelegate {


 var tableView: UITableView?


// 代理
    func didTapButton() {
    tableView?.buttonTapped()
    }
}