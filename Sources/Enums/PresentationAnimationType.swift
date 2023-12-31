import UIKit

/**
 Predefined Transition Animation Type
 */
public enum PresentationAnimationType: ThenStringEnum {
    case flip
    case crossDissolve
    case cover(from: TransitionAnimationType.Direction)
    case zoom
    case dropDown
    
    public var stringValue: String {
        return String(describing: self)
    }
    
    public var systemTransition: UIModalTransitionStyle? {
        switch self {
        case .crossDissolve:        return .crossDissolve
        case .flip:                 return .flipHorizontal
        case .cover(from: .bottom): return .coverVertical
        default:                    return nil
        }
    }
    
    public init?(string: String?) {
        guard let string = string else {
            return nil
        }
        guard let (name, params) = string.extractNameAndParams() else {
            return nil
        }
        switch name {
        case "crossdissolve":
            self = .crossDissolve
        case "flip":
            self = .flip
        case "zoom":
            self = .zoom
        case "dropdown":
            self = .dropDown
        case "cover":
            self = .cover(from: TransitionAnimationType.Direction.fromString(forParams: params) ?? .bottom)
        default:
            return nil
        }
    }
    
}

extension PresentationAnimationType: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(stringValue)
    }
    
    public static func == (lhs: PresentationAnimationType, rhs: PresentationAnimationType) -> Bool {
        return lhs.stringValue == rhs.stringValue
    }
}
