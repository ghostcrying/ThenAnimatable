import UIKit

public protocol ViewControllerAnimatedTransitioning: UIViewControllerAnimatedTransitioning {
    /**
     Transition duration
     */
    var transitionDuration: Duration { get set }
    
}

public extension ViewControllerAnimatedTransitioning {
    func retrieveViews(transitionContext: UIViewControllerContextTransitioning) -> (UIView?, UIView?, UIView?) {
        return (transitionContext.view(forKey: UITransitionContextViewKey.from),
                transitionContext.view(forKey: UITransitionContextViewKey.to),
                transitionContext.containerView)
    }
    
    func retrieveViewControllers(transitionContext: UIViewControllerContextTransitioning) -> (UIViewController?, UIViewController?, UIView?) {
        return (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
                transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
                transitionContext.containerView)
    }
    
    func retrieveTransitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if let transitionContext = transitionContext {
            return transitionContext.isAnimated ? transitionDuration : 0
        }
        return 0
    }
}
