//
//  AnimationPromise.swift
//  ThenAnimatable
//
//  Created by ghost on 01/08/2023.

import UIKit
import Foundation

public class AnimationPromise<T: AnimatableViewProtocol> where T: AnimatableProtocol {
    
    private var subject: T
    private var animationList = [AnimationTuple]()
    private var delayForNextAnimation = 0.0
    private var completion: AnimatableCompletion?
    
    init(_ view: T) {
        self.subject = view
    }
    
    func animationCompleted() {
        animationList.removeFirst()
        if let currentAnimation = animationList.first {
            subject.doAnimation(currentAnimation.type, configuration: currentAnimation.configuration, promise: self)
        } else {
            completion?()
        }
    }
    
    public func completion(_ completion: AnimatableCompletion?) {
        self.completion = completion
    }
    
    @discardableResult public func then(
        _ animation: AnimationType,
        duration: TimeInterval? = nil,
        damping: CGFloat? = nil,
        velocity: CGFloat? = nil,
        force: CGFloat? = nil,
        timingFunction: TimingFunctionType? = nil)
    -> AnimationPromise {
        
        let configuration = AnimationConfiguration(
            damping: damping ?? subject.damping,
            velocity: velocity ?? subject.velocity,
            duration: duration ?? subject.duration,
            delay: delayForNextAnimation,
            force: force ?? subject.force,
            timingFunction: timingFunction ?? subject.timingFunction
        )
        let animTuple = AnimationTuple(type: animation, configuration: configuration)
        animationList.append(animTuple)
        if animationList.count == 1 {
            // If it's the only animation, launch it immediately
            subject.doAnimation(animation, configuration: animTuple.configuration, promise: self)
        }
        delayForNextAnimation = 0
        return self
    }
    
    @discardableResult public func delay(_ delay: TimeInterval) -> AnimationPromise {
        delayForNextAnimation = delay
        return self
    }
    
}
