import UIKit
import Foundation

public class ActivityIndicatorAnimationLineSpinFadeLoader: ActivityIndicatorAnimating {
    
    // MARK: Properties
    
    fileprivate let duration: CFTimeInterval = 1.2
    fileprivate let timingFunction: TimingFunctionType = .easeInOut
    
    // MARK: ActivityIndicatorAnimating
    
    public func configureAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        let lineSpacing: CGFloat = 2
        let lineSize = CGSize(width: (size.width - 4 * lineSpacing) / 5, height: (size.height - 2 * lineSpacing) / 3)
        let x = (layer.bounds.size.width - size.width) / 2
        let y = (layer.bounds.size.height - size.height) / 2
        let beginTime = layer.currentMediaTime
        let beginTimes: [CFTimeInterval] = [0.12, 0.24, 0.36, 0.48, 0.6, 0.72, 0.84, 0.96]
        let animation = defaultAnimation
        
        for i in 0 ..< 8 {
            let line = makeLineLayer(angle: CGFloat.pi / 4 * CGFloat(i),
                                     size: lineSize,
                                     origin: CGPoint(x: x, y: y),
                                     containerSize: size,
                                     color: color)
            animation.beginTime = beginTime + beginTimes[i]
            line.add(animation, forKey: "animation")
            layer.addSublayer(line)
        }
    }
    
}

// MARK: - Setup

private extension ActivityIndicatorAnimationLineSpinFadeLoader {
    
    var defaultAnimation: CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: .opacity)
        animation.keyTimes = [0, 0.5, 1]
        animation.timingFunctionsType = [timingFunction, timingFunction]
        animation.values = [1, 0.3, 1]
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    func makeLineLayer(angle: CGFloat, size: CGSize, origin: CGPoint, containerSize: CGSize, color: UIColor) -> CALayer {
        let radius = containerSize.width / 2 - max(size.width, size.height) / 2
        let lineContainerSize = CGSize(width: max(size.width, size.height), height: max(size.width, size.height))
        let lineContainer = CALayer()
        let lineContainerFrame = CGRect(
            x: origin.x + radius * (cos(angle) + 1),
            y: origin.y + radius * (sin(angle) + 1),
            width: lineContainerSize.width,
            height: lineContainerSize.height)
        let line = ActivityIndicatorShape.line.makeLayer(size: size, color: color)
        let lineFrame = CGRect(
            x: (lineContainerSize.width - size.width) / 2,
            y: (lineContainerSize.height - size.height) / 2,
            width: size.width,
            height: size.height)
        
        lineContainer.frame = lineContainerFrame
        line.frame = lineFrame
        lineContainer.addSublayer(line)
        lineContainer.sublayerTransform = CATransform3DMakeRotation(CGFloat.pi / 2 + angle, 0, 0, 1)
        return lineContainer
    }
    
}
