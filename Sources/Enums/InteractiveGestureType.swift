import Foundation

/**
 Interactive gesture type: used to pop or dismiss view controller for transitons.
 */
public enum InteractiveGestureType {
    case none
    case `default`          /// The default interactive gesture type from `AnimatedTransitioning`
    case pan(from: GestureDirection)
    case screenEdgePan(from: GestureDirection)
    case pinch(direction: GestureDirection)
    
    var stringValue: String {
        return String(describing: self)
    }
    
    /// Returns the string value without qualification
    public var stringValueWithoutQualification: String {
        let namespace = "ThenAnimatable." + String(describing: InteractiveGestureType.self) + "." + String(describing: GestureDirection.self) + "."
        return String(describing: self).replacingOccurrences(of: namespace, with: "")
    }
    
    /**
     GestureDirection: Used to specify the direction in `InteractiveGestureType`
     */
    public enum GestureDirection: String {
        case horizontal
        case vertical
        case left
        case right
        case top
        case bottom
        case close
        case open
    }
}

extension InteractiveGestureType: ThenStringEnum {
    public init(string: String?) {
        guard let string = string else {
            self = .none
            return
        }
        
        guard let (name, params) = string.extractNameAndParams() else {
            self = .none
            return
        }
        switch name {
        case "default":
            self = .default
        case "pan":
            let direction = GestureDirection(raw: params.toString(0), defaultValue: .left)
            self = .pan(from: direction)
        case "screenedgepan":
            let direction = GestureDirection(raw: params.toString(0), defaultValue: .left)
            self = .screenEdgePan(from: direction)
        case "pinch":
            let direction = GestureDirection(raw: params.toString(0), defaultValue: .open)
            self = .pinch(direction: direction)
        default:
            self = .none
        }
    }
}
