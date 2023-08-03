//
//  PresentSegues.swift
//  ThenAnimatable
//
//  Created by ghost on 2023/8/3.
//

import UIKit

open class PresentCardsSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .cards(direction: .forward))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentExplodeSegue: UIStoryboardSegue {
    open override func perform() {
        let transitionType: TransitionAnimationType = .explode(xFactor: nil, minAngle: nil, maxAngle: nil)
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: transitionType)
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFadeSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .fade(direction: .cross))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFadeWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        let transitionPresenterManager = TransitionPresenterManager.shared
        destination.transitioningDelegate = transitionPresenterManager.retrievePresenter(transitionAnimationType: .fade(direction: .cross),
                                                                                         interactiveGestureType: .default)
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFlipSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .flip(from: .left))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFlipWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .flip(from: .left),
                                                                                                interactiveGestureType: .default)
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFoldSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .fold(from: .left, folds: nil))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentFoldWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .fold(from: .left, folds: nil),
                                                                                                interactiveGestureType: .default)
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentNatGeoSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .natGeo(to: .left))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentOverCurrentContextSegue: UIStoryboardSegue {
    open override func perform() {
        if let modalVC = destination as? AnimatableModalViewController {
            let source = self.source
            modalVC.contextFrameForPresentation = {
                let correctedOrigin = source.view.convert(source.view.frame.origin, to: nil)
                return CGRect(origin: correctedOrigin, size: source.view.bounds.size)
            }
        }
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentPortalSegue: UIStoryboardSegue {
    open override func perform() {
        let transitionAnimationType: TransitionAnimationType = .portal(direction: .forward, zoomScale: nil)
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: transitionAnimationType)
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentPortalWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        let transitionAnimationType: TransitionAnimationType = .portal(direction: .forward, zoomScale: nil)
        destination.transitioningDelegate =
                TransitionPresenterManager.shared.retrievePresenter(
                    transitionAnimationType: transitionAnimationType,
                    interactiveGestureType: .default
                )
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentSlideSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .slide(to: .left, isFade: false))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentSlideWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate =
                TransitionPresenterManager.shared.retrievePresenter(
                    transitionAnimationType: .slide(to: .left, isFade: false),
                    interactiveGestureType: .default
                )
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentTurnSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate = TransitionPresenterManager.shared.retrievePresenter(transitionAnimationType: .turn(from: .left))
        source.present(destination, animated: true, completion: nil)
    }
}

open class PresentTurnWithDismissInteractionSegue: UIStoryboardSegue {
    open override func perform() {
        destination.transitioningDelegate =
                TransitionPresenterManager.shared.retrievePresenter(
                    transitionAnimationType: .turn(from: .left),
                    interactiveGestureType: .default
                )
        source.present(destination, animated: true, completion: nil)
    }
}
