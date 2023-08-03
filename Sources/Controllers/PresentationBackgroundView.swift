import UIKit

final class PresentationBackgroundView: UIView {
    
    var passthroughViews: [UIView] = []
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var view = super.hitTest(point, with: event)
        guard view == self else {
            return view
        }
        
        for passthroughView in passthroughViews {
            view = passthroughView.hitTest(convert(point, to: passthroughView), with: event)
            if view != nil {
                break
            }
        }
        return view
    }
    
}
