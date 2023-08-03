import UIKit

public extension CALayer {
    class func animate(_ animation: AnimatableExecution, completion: AnimatableCompletion? = nil) {
        CATransaction.begin()
        if let completion = completion {
            CATransaction.setCompletionBlock { completion() }
        }
        animation()
        CATransaction.commit()
    }
}

extension CALayer {
    var currentMediaTime: CFTimeInterval {
        return convertTime(CACurrentMediaTime(), from: nil)
    }
}
