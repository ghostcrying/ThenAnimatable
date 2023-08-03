import UIKit

@IBDesignable open class AnimatableSlider:
    UISlider,
    SliderImagesDesignable,
    BorderDesignable,
    RotationDesignable,
    ShadowDesignable,
    AnimatableProtocol,
    AnimatableViewProtocol
{
    
    // MARK: - SliderImagesDesignable
    
    @IBInspectable open var thumbImage: UIImage? {
        didSet {
            configureThumbImage()
        }
    }
    
    @IBInspectable open var thumbHighlightedImage: UIImage? {
        didSet {
            configureThumbImage()
        }
    }
    
    @IBInspectable open var minimumTrackImage: UIImage? {
        didSet {
            configureMinimumTrackImage()
        }
    }
    
    @IBInspectable open var minimumTrackHighlightedImage: UIImage? {
        didSet {
            configureMinimumTrackImage()
        }
    }
    
    @IBInspectable open var maximumTrackImage: UIImage? {
        didSet {
            configureMaximumTrackImage()
        }
    }
    
    @IBInspectable open var maximumTrackHighlightedImage: UIImage? {
        didSet {
            configureMaximumTrackImage()
        }
    }
    
    // MARK: - BorderDesignable
    open var borderType: BorderType  = .solid {
        didSet {
            configureBorder()
        }
    }
    
    @IBInspectable var _borderType: String? {
        didSet {
            borderType = BorderType(string: _borderType)
        }
    }
    
    @IBInspectable open var borderColor: UIColor? {
        didSet {
            configureBorder()
        }
    }
    
    @IBInspectable open var borderWidth: CGFloat = CGFloat.nan {
        didSet {
            configureBorder()
        }
    }
    
    open var borderSides: BorderSides  = .AllSides {
        didSet {
            configureBorder()
        }
    }
    
    @IBInspectable var _borderSides: String? {
        didSet {
            borderSides = BorderSides(rawValue: _borderSides)
        }
    }
    // MARK: - RotationDesignable
    @IBInspectable open var rotate: CGFloat = CGFloat.nan {
        didSet {
            configureRotate()
        }
    }
    
    // MARK: - ShadowDesignable
    @IBInspectable open var shadowColor: UIColor? {
        didSet {
            configureShadowColor()
        }
    }
    
    @IBInspectable open var shadowRadius: CGFloat = CGFloat.nan {
        didSet {
            configureShadowRadius()
        }
    }
    
    @IBInspectable open var shadowOpacity: CGFloat = CGFloat.nan {
        didSet {
            configureShadowOpacity()
        }
    }
    
    @IBInspectable open var shadowOffset: CGPoint = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
        didSet {
            configureShadowOffset()
        }
    }
    
    // MARK: - Animatable
    open var animationType: AnimationType = .none
    @IBInspectable  var _animationType: String? {
        didSet {
            animationType = AnimationType(string: _animationType)
        }
    }
    @IBInspectable open var autoRun: Bool = true
    @IBInspectable open var duration: Double = 0.7
    @IBInspectable open var delay: Double = 0
    @IBInspectable open var damping: CGFloat = 0.7
    @IBInspectable open var velocity: CGFloat = 0.7
    @IBInspectable open var force: CGFloat = 1
    @IBInspectable var _timingFunction: String = "" {
        didSet {
            timingFunction = TimingFunctionType(string: _timingFunction)
        }
    }
    open var timingFunction: TimingFunctionType = .none
    public var view: UIView { self }
    
    // MARK: - Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        configureAfterLayoutSubviews()
        autoRunAnimation()
    }
    
    // MARK: - Private
    
    fileprivate func configureAfterLayoutSubviews() {
        configureBorder()
    }
}
