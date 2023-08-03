import UIKit

@IBDesignable
open class AnimatableBarButtonItem: UIBarButtonItem, BarButtonItemDesignable, AnimatableProtocol {
    
    // MARK: - BarButtonItemDesignable
    @IBInspectable open var roundedImage: UIImage?
    
    // MARK: - Lifecycle
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureInspectableProperties()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        configureInspectableProperties()
    }
    
// TODO: animations
//  public override func layoutSubviews() {
//    super.layoutSubviews()
//
//    autoRunAnimation()
//  }
    
    // MARK: - Animatable
    open var animationType: AnimationType = .none
    @IBInspectable var _animationType: String? {
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
    
    // MARK: - Private
    fileprivate func configureInspectableProperties() {
        configureBarButtonItemImage()
    }
}
