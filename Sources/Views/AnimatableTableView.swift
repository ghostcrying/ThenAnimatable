import UIKit

@IBDesignable open class AnimatableTableView:
    UITableView,
    FillDesignable,
    BorderDesignable,
    GradientDesignable,
    BackgroundImageDesignable,
    BlurDesignable,
    RefreshControlDesignable,
    AnimatableProtocol,
    AnimatableViewProtocol
{
    
    // MARK: - FillDesignable
    @IBInspectable open var fillColor: UIColor? {
        didSet {
            configureFillColor()
        }
    }
    
    open var predefinedColor: ColorType? {
        didSet {
            configureFillColor()
        }
    }
    @IBInspectable var _predefinedColor: String? {
        didSet {
            predefinedColor = ColorType(string: _predefinedColor)
        }
    }
    
    @IBInspectable open var opacity: CGFloat = CGFloat.nan {
        didSet {
            configureOpacity()
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
    // MARK: - GradientDesignable
    open var gradientMode: GradientMode = .linear
    @IBInspectable var _gradientMode: String? {
        didSet {
            gradientMode = GradientMode(string: _gradientMode) ?? .linear
        }
    }
    @IBInspectable open var startColor: UIColor?
    @IBInspectable open var endColor: UIColor?
    open var predefinedGradient: GradientType?
    @IBInspectable var _predefinedGradient: String? {
        didSet {
            predefinedGradient = GradientType(string: _predefinedGradient)
        }
    }
    open var startPoint: GradientStartPoint = .top
    @IBInspectable var _startPoint: String? {
        didSet {
            startPoint = GradientStartPoint(string: _startPoint, default: .top)
        }
    }
    
    // MARK: - BackgroundImageDesignable
    @IBInspectable open var backgroundImage: UIImage? {
        didSet {
            configureBackgroundImage()
            configureBackgroundBlurEffectStyle()
        }
    }
    
    // MARK: - BlurDesignable
    open var blurEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBackgroundBlurEffectStyle()
        }
    }
    @IBInspectable var _blurEffectStyle: String? {
        didSet {
            blurEffectStyle = UIBlurEffect.Style(string: _blurEffectStyle)
        }
    }
    open var vibrancyEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBackgroundBlurEffectStyle()
        }
    }
    @IBInspectable var _vibrancyEffectStyle: String? {
        didSet {
            vibrancyEffectStyle = UIBlurEffect.Style(string: _vibrancyEffectStyle)
        }
    }
    
    @IBInspectable open var blurOpacity: CGFloat = CGFloat.nan {
        didSet {
            configureBackgroundBlurEffectStyle()
        }
    }
    
    // MARK: - RefreshControlDesignable
    @IBInspectable open var hasRefreshControl: Bool = false {
        didSet {
            configureRefreshController()
        }
    }
    @IBInspectable open var refreshControlTintColor: UIColor? {
        didSet {
            configureRefreshController()
        }
    }
    @IBInspectable open var refreshControlBackgroundColor: UIColor? {
        didSet {
            configureRefreshController()
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
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureInspectableProperties()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureInspectableProperties()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        autoRunAnimation()
        configureAfterLayoutSubviews()
    }
    
    // MARK: - Private
    fileprivate func configureInspectableProperties() {
        configureOpacity()
    }
    
    fileprivate func configureAfterLayoutSubviews() {
        configureBorder()
        configureGradient()
    }
}
