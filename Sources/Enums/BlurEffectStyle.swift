import UIKit

extension UIBlurEffect.Style: ThenStringEnum {
    /** initialize a UIBlurEffectStyle from string. `extraLight`, `light`, `dark`, `prominent` (iOS 10+), `extraLight` (iOS 10+)
     */
    public init?(string: String?) {
        guard let string = string?.lowercased() else {
            return nil
        }
        
        switch string {
        case "extralight":
            self = .extraLight
            return
        case "light":
            self = .light
            return
        case "dark":
            self = .dark
            return
        case "prominent":
            self = .prominent
            return
        case "regular":
            self = .regular
            return
        default: break
        }
        return nil
    }
}
