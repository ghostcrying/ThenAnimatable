//
//  ThenAnimatable.swift
//  ThenAnimatable
//
//  Created by ghost on 01/08/2023.

import UIKit
import Foundation

public final class ThenAnimatable:
    NSObject, CornerDesignable, FillDesignable, BorderDesignable, RotationDesignable, ShadowDesignable, BlurDesignable, GradientDesignable, MaskDesignable, AnimatableProtocol, AnimatableViewProtocol
{
    public let view: UIView
    
    // MARK: Life cycle
    
    fileprivate init(view: UIView) {
        self.view = view
        super.init()
    }
    
    public func reload() {
        configureMask(in: view, previousMaskType: maskType)
        configureCornerRadius(in: view)
        configureBorder(in: view)
        configureMaskShadow(in: view)
    }
    
    // MARK: - CornerDesignable
    
    public var cornerRadius: CGFloat = CGFloat.nan {
        didSet {
            configureCornerRadius(in: view)
        }
    }
    
    public var cornerSides: CornerSides  = .allSides {
        didSet {
            configureCornerRadius(in: view)
        }
    }
    
    // MARK: - FillDesignable
    
    public var fillColor: UIColor? {
        didSet {
            configureFillColor(in: view)
        }
    }
    
    public var predefinedColor: ColorType? {
        didSet {
            configureFillColor(in: view)
        }
    }
    
    public var opacity: CGFloat = CGFloat.nan {
        didSet {
            configureOpacity(in: view)
        }
    }
    
    // MARK: - BorderDesignable
    
    public var borderType: BorderType  = .solid {
        didSet {
            configureBorder(in: view)
        }
    }
    
    public var borderColor: UIColor? {
        didSet {
            configureBorder(in: view)
        }
    }
    
    public var borderWidth: CGFloat = CGFloat.nan {
        didSet {
            configureBorder(in: view)
        }
    }
    
    public var borderSides: BorderSides  = .AllSides {
        didSet {
            configureBorder(in: view)
        }
    }
    
    // MARK: - RotationDesignable
    
    public var rotate: CGFloat = CGFloat.nan {
        didSet {
            configureRotate(in: view)
        }
    }
    
    // MARK: - ShadowDesignable
    
    public var shadowColor: UIColor? {
        didSet {
            configureShadowColor(in: view)
        }
    }
    
    public var shadowRadius: CGFloat = CGFloat.nan {
        didSet {
            configureShadowRadius(in: view)
        }
    }
    
    public var shadowOpacity: CGFloat = CGFloat.nan {
        didSet {
            configureShadowOpacity(in: view)
        }
    }
    
    public var shadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
        didSet {
            configureShadowOffset(in: view)
        }
    }
    
    // MARK: - BlurDesignable
    
    public var blurEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }
    
    public var vibrancyEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }
    
    public var blurOpacity: CGFloat = CGFloat.nan {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }
    
    // MARK: - GradientDesignable
    
    public var gradientMode: GradientMode = .linear {
        didSet {
            configureGradient(in: view)
        }
    }
    public var startColor: UIColor? {
        didSet {
            configureGradient(in: view)
        }
    }
    public var endColor: UIColor? {
        didSet {
            configureGradient(in: view)
        }
    }
    public var predefinedGradient: GradientType? {
        didSet {
            configureGradient(in: view)
        }
    }
    public var startPoint: GradientStartPoint = .top {
        didSet {
            configureGradient(in: view)
        }
    }
    
    // MARK: - MaskDesignable
    
    public var maskType: MaskType = .none {
        didSet {
            configureMask(in: view, previousMaskType: oldValue)
            configureBorder(in: view)
            configureMaskShadow(in: view)
        }
    }
    
    
    // MARK: - Animatable
    
    public var animationType: AnimationType = .none
    var _animationType: String? {
        didSet {
            animationType = AnimationType(string: _animationType)
        }
    }
    public var autoRun: Bool = true
    public var duration: Double = 0.25
    public var delay: Double = 0
    public var damping: CGFloat = 0.7
    public var velocity: CGFloat = 0.7
    public var force: CGFloat = 1
    var _timingFunction: String = "" {
        didSet {
            timingFunction = TimingFunctionType(string: _timingFunction)
        }
    }
    public var timingFunction: TimingFunctionType = .none
    
}


// MARK: - AssociatedKeys

private struct AssociatedKeys {
    static var animatable = "com.then.uikit.animate.view"
}

public extension UIView {
    
    var animatable: ThenAnimatable {
        get {
            var value = objc_getAssociatedObject(self, &AssociatedKeys.animatable) as? ThenAnimatable
            if value == nil {
                value = ThenAnimatable(view: self)
                self.animatable = value!
            }
            return value!
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.animatable, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
}
