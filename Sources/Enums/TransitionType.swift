import UIKit

enum TransitionType {
    case navigationTransition(UINavigationController.Operation)
    case presentationTransition(PresentationOperation)
    case tabTransition(TabOperation)
}

enum PresentationOperation {
    case presentation, dismissal
}

enum TabOperation {
    case toLeft, toRight
}
