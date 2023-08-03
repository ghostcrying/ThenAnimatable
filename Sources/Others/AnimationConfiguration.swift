//
//  AnimationConfiguration.swift
//  ThenAnimatable
//
//  Created by ghost on 2023/8/3.
//

import UIKit
import Foundation

typealias AnimationTuple = (type: AnimationType, configuration: AnimationConfiguration)

struct AnimationConfiguration {
    let damping: CGFloat
    let velocity: CGFloat
    let duration: TimeInterval
    let delay: TimeInterval
    let force: CGFloat
    let timingFunction: TimingFunctionType
}

extension AnimationConfiguration {
    
    /// Options for spring animation.
    var options: UIView.AnimationOptions {
        if let curveOption = timingFunction.viewAnimationCurveOption {
            return [
                .allowUserInteraction,
                curveOption,
                .overrideInheritedCurve,
                .overrideInheritedOptions,
                .overrideInheritedDuration]
        }
        return [.allowUserInteraction]
    }
    
}
