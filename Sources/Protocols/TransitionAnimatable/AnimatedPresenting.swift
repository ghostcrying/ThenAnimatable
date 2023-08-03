import UIKit

public protocol AnimatedPresenting: ViewControllerAnimatedTransitioning {
}

public extension AnimatedPresenting {
    func isPresenting(transitionContext: UIViewControllerContextTransitioning) -> Bool {
        let (fromViewController, toViewController, _) = retrieveViewControllers(transitionContext: transitionContext)
        return toViewController?.presentingViewController == fromViewController
    }
}
