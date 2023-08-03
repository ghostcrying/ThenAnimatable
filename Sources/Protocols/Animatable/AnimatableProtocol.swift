//
//  Animatable.swift
//  ThenAnimatable
//
//  Created by ghost on 01/08/2023.

import UIKit
import Foundation

public protocol AnimatableProtocol: AnyObject {
    
    /**
     `AnimationType` enum
     */
    var animationType: AnimationType { get set }
    
    /**
     Auto run flag, if `true` it will automatically start animation when `layoutSubviews`. Default should be `true`
     */
    var autoRun: Bool { get set }
    
    /**
     Animation duration (in seconds)
     */
    var duration: TimeInterval { get set }
    
    /**
     Animation delay (in seconds, default value should be 0)
     */
    var delay: TimeInterval { get set }
    
    /**
     Spring animation damping (0 ~ 1, default value should be 0.7)
     */
    var damping: CGFloat { get set }
    
    /**
     Spring animation velocity (default value should be 0.7)
     */
    var velocity: CGFloat { get set }
    
    /**
     Animation force (default value should be 1)
     */
    var force: CGFloat { get set }
    
    /**
     Animation function as a timing curve. (default value should be none)
     */
    var timingFunction: TimingFunctionType { get set }
}

public extension AnimationType {
    
    /// This animation use damping and velocity parameters.
    var isSpring: Bool {
        switch self {
        case .moveBy, .moveTo, .scale:
            return true
        case .squeeze, .squeezeFade, .slide, .slideFade, .zoom, .zoomInvert:
            return true
        case .fade(way: .in), .fade(way: .out):
            return true
        case .rotate, .shake, .flip, .pop, .squash, .morph, .swing, .wobble, .flash, .spin:
            return false
        case .fade(way: .inOut), .fade(way: .outIn):
            return false
        case .compound(let animations, _):
            return animations.contains { $0.isSpring }
        case .none:
            return false
        }
    }
    
    /// This animation use timing function parameter.
    var isCubic: Bool {
        switch self {
        case .moveBy, .moveTo, .scale:
            return true
        case .rotate, .shake, .flip, .pop, .squash, .morph, .swing, .wobble, .flash, .spin:
            return true
        case .fade(.inOut), .fade(.outIn):
            return true
        case .squeeze, .squeezeFade, .slide, .slideFade, .zoom, .zoomInvert:
            return false
        case .fade(way: .in), .fade(way: .out):
            return false
        case .compound(let animations, _):
            return animations.contains { $0.isCubic }
        case .none:
            return false
        }
    }
}

/// Enumeration for Core Animation key path.
enum AnimationKeyPath: String {
    // Positions
    case position     = "position"
    case positionX    = "position.x"
    case positionY    = "position.y"
    // Transforms
    case transform    = "transform"
    case rotation     = "transform.rotation"
    case rotationX    = "transform.rotation.x"
    case rotationY    = "transform.rotation.y"
    case rotationZ    = "transform.rotation.z"
    case scale        = "transform.scale"
    case scaleX       = "transform.scale.x"
    case scaleY       = "transform.scale.y"
    case scaleZ       = "transform.scale.z"
    case translation  = "transform.translation"
    case translationX = "transform.translation.x"
    case translationY = "transform.translation.y"
    case translationZ = "transform.translation.z"
    // Stroke
    case strokeEnd    = "strokeEnd"
    case strokeStart  = "strokeStart"
    // Other properties
    case opacity      = "opacity"
    case path         = "path"
    case lineWidth    = "lineWidth"
}

extension CABasicAnimation {
    convenience init(keyPath: AnimationKeyPath) {
        self.init(keyPath: keyPath.rawValue)
    }
}

extension CAKeyframeAnimation {
    convenience init(keyPath: AnimationKeyPath) {
        self.init(keyPath: keyPath.rawValue)
    }
}

extension UIView {
    /// Animate view using `AnimationConfiguration`.
    class func animate(with configuration: AnimationConfiguration, animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        if configuration.timingFunction.isCurveOption {
            UIView.animate(withDuration: configuration.duration,
                           delay: configuration.delay,
                           options: configuration.options,
                           animations: animations,
                           completion: completion)
        } else {
            UIView.animate(withDuration: configuration.duration,
                           delay: configuration.delay,
                           usingSpringWithDamping: configuration.damping,
                           initialSpringVelocity: configuration.velocity,
                           options: configuration.options,
                           animations: animations,
                           completion: completion)
        }
    }
}
