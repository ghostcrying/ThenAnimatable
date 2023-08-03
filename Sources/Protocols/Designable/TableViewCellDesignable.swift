import UIKit

public protocol TableViewCellDesignable: AnyObject {
    var removeSeparatorMargins: Bool { get set }
}

public extension TableViewCellDesignable where Self: UITableViewCell {
    func configureSeparatorMargins() {
        if removeSeparatorMargins {
            if responds(to: #selector(setter: UITableViewCell.separatorInset)) {
                separatorInset = .zero
            }
            
            if responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
                preservesSuperviewLayoutMargins = false
            }
            if responds(to: #selector(setter: UIView.layoutMargins)) {
                layoutMargins = .zero
            }
        }
    }
}
