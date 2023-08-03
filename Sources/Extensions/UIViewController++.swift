import UIKit

// MARK: - UIStoryboardSegue
public extension UIViewController {
    
    @IBAction func unwindToViewController(_ sender: UIStoryboardSegue) { }
    
    @IBAction func dismissCurrentViewController(_ sender: UIStoryboardSegue) {
        sender.source.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func popToRootViewController(_ sender: UIStoryboardSegue) {
        if let navigationController = sender.source.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
}
