import Foundation

/**
 A protocol provides extension method for converting `String` into `enum`.
 Because `@IBInspectable` property can not support `enum` directly. To provide both `enum` API in code and `@IBInspectable` supported type `String` in Interface Builder, we use `IBEnum` to bridge Swift `enum` and `String`
 */
public protocol ThenStringEnum {
    /**
     Initializes a swift `enum` with provided optional string
     
     - Parameter string: The optional string to be converted into `enum`.
     */
    init?(string: String?)
}

extension ThenStringEnum {
    init(string: String?, default defaultValue: Self) {
        self = Self(string: string) ?? defaultValue
    }
}

/// IBEnum provide default initializer for RawRepresentable Enum
public extension ThenStringEnum where Self: RawRepresentable & CaseIterable {
    init?(string: String?) {
        let lowerString = string?.lowercased()
        for item in Self.allCases {
            if String(describing: item.rawValue).lowercased() == lowerString {
                self = item
                return
            }
        }
        return nil
    }
    
}
