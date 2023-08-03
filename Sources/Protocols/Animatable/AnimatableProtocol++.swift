//
//  Animatable + Promise.swift
//  ThenAnimatable
//
//  Created by 陈卓 on 2023/8/3.
//

import UIKit
import Foundation

// MARK: - AnimatableViewProtocol + Promise
public extension AnimatableProtocol where Self: AnimatableViewProtocol {
    
    @discardableResult
    func animate(_ animation: AnimationType,
                 duration: TimeInterval? = nil,
                 damping: CGFloat? = nil,
                 velocity: CGFloat? = nil,
                 force: CGFloat? = nil) -> AnimationPromise<Self> {
        AnimationPromise(self)
            .delay(delay)
            .then(animation, duration: duration, damping: damping, velocity: velocity, force: force)
    }
    
    func delay(_ delay: TimeInterval) -> AnimationPromise<Self> {
        AnimationPromise(self).delay(delay)
    }
    
    internal func doAnimation(_ animation: AnimationType? = nil, configuration: AnimationConfiguration, promise: AnimationPromise<Self>) {
        let completion = {
            promise.animationCompleted()
        }
        self.view.doAnimation(animation ?? self.animationType, configuration: configuration, completion: completion)
    }
    
    /**
     `autoRunAnimation` method, should be called in layoutSubviews() method
     */
    func autoRunAnimation() {
        if autoRun {
            autoRun = false
            animate(animationType)
        }
    }
    
}

// MARK: - Animatable + UIBarItem
public extension AnimatableProtocol where Self: UIBarItem {
    
    func animate(
        _ animation: AnimationType? = nil,
        duration: TimeInterval? = nil,
        damping: CGFloat? = nil,
        velocity: CGFloat? = nil,
        force: CGFloat? = nil,
        view: UIView,
        completion: AnimatableCompletion? = nil)
    {
        let configuration = AnimationConfiguration(
            damping: damping ?? self.damping,
            velocity: velocity ?? self.velocity,
            duration: duration ?? self.duration,
            delay: 0,
            force: force ?? self.force,
            timingFunction: timingFunction ?? self.timingFunction
        )
        view.doAnimation(animation ?? self.animationType, configuration: configuration) {
            completion?()
        }
    }
    
}
