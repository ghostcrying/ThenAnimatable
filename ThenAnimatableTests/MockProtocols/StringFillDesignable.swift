import Foundation
@testable import ThenAnimatable

// MARK: - StringFillDesignable Protocol

protocol StringFillDesignable: FillDesignable {
    
    var _predefinedColor: String? { get set }
    
}

// MARK: - Classes with StringFillDesignable conformance

extension AnimatableView: StringFillDesignable {}
extension AnimatableScrollView: StringFillDesignable {}
extension AnimatableButton: StringFillDesignable {}
extension AnimatableCheckBox: StringFillDesignable {}
extension AnimatableImageView: StringFillDesignable {}
extension AnimatableStackView: StringFillDesignable {}
extension AnimatableTableView: StringFillDesignable {}
extension AnimatableTableViewCell: StringFillDesignable {}
extension AnimatableCollectionViewCell: StringFillDesignable {}
extension AnimatableTextView: StringFillDesignable {}
extension AnimatableTextField: StringFillDesignable {}
extension AnimatableLabel: StringFillDesignable {}
