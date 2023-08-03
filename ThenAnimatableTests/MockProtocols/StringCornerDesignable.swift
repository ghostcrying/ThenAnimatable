import Foundation
@testable import ThenAnimatable

// MARK: - StringCornerDesignable Protocol

protocol StringCornerDesignable: CornerDesignable {
    
    var _cornerSides: String? { get set }
    
}

// MARK: - Classes with StringCornerDesignable conformance

extension AnimatableView: StringCornerDesignable {}
extension AnimatableScrollView: StringCornerDesignable {}
extension AnimatableButton: StringCornerDesignable {}
extension AnimatableCheckBox: StringCornerDesignable {}
extension AnimatableImageView: StringCornerDesignable {}
extension AnimatableLabel: StringCornerDesignable {}
extension AnimatableStackView: StringCornerDesignable {}
extension AnimatableTableViewCell: StringCornerDesignable {}
extension AnimatableTextField: StringCornerDesignable {}
extension AnimatableTextView: StringCornerDesignable {}
extension AnimatableCollectionViewCell: StringCornerDesignable {}
