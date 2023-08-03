import UIKit
import Foundation

/// If this syntax uses a type constraint Element: UIView, which means that the extension is only applicable to arrays whose element type is UIView or its subclass. In other words, the methods and properties within this extension will only be available if the elements in the array are of type UIView or its subclass.
/// If this syntax uses an equality constraint Element == UIView, which means that the extension is only applicable to arrays whose element type is exactly UIView. It does not include subclasses of UIView.
public extension Array where Element: AnimatableProtocol & AnimatableViewProtocol {
    
    /// Sequence excute animations
    func animate(_ animation: AnimationType,
                 duration: TimeInterval? = nil,
                 damping: CGFloat? = nil,
                 velocity: CGFloat? = nil,
                 force: CGFloat? = nil,
                 completion: (() -> Void)? = nil) {
        /// If use semple the CATransaction.setCompletionBlock { print("animate finish") } will not trigger.
        let dispatchGroup = DispatchGroup()
        var delay: TimeInterval = 0
        for subject in self {
            dispatchGroup.enter()
            subject
                .delay(delay)
                .then(animation, duration: duration, damping: damping, velocity: velocity, force: force)
                .completion {
                    dispatchGroup.leave()
                }
            delay += duration ?? subject.duration
        }
        dispatchGroup.notify(queue: .main) {
            completion?()
        }
    }
    
}

public extension Array where Element: UIView {
    
    /// Sequence excute animations
    func animate(_ animation: AnimationType,
                 duration: TimeInterval? = nil,
                 damping: CGFloat? = nil,
                 velocity: CGFloat? = nil,
                 force: CGFloat? = nil,
                 completion: (() -> Void)? = nil) {
        
        map { $0.animatable }
            .animate(animation, duration: duration, damping: damping, velocity: velocity, force: force, completion: completion)
    }
}
 
