class UITableView {
    weak var delegate: UITableViewDelegate?

    func buttonTapped() {
        delegate?.didTapButton()
    }
}