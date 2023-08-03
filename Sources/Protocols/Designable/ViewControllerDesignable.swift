import UIKit

public protocol ViewControllerDesignable: AnyObject {
    var hideNavigationBar: Bool { get set }
}

public extension ViewControllerDesignable where Self: UIViewController {
    
    func configureHideNavigationBar() {
        navigationController?.isNavigationBarHidden = hideNavigationBar
    }
    
    func resetHideNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
    
}
