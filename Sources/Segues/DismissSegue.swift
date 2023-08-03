import UIKit

open class DismissSegue: UIStoryboardSegue {
    open override func perform() {
        source.dismiss(animated: true, completion: nil)
    }
}
