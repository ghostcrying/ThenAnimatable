import XCTest
@testable import ThenAnimatable

protocol RotationDesignableTests: AnyObject {
    
    associatedtype Element
    
    var element: Element { get set }
    
    func testRotate()
    
}

// MARK: - UIView Tests

extension RotationDesignableTests where Element: UIView, Element: RotationDesignable {
    
    func _testRotate() {
        element.rotate = -360
        XCTAssertEqual(element.transform, .identity)
        element.rotate = 360
        XCTAssertEqual(element.transform, .identity)
        element.rotate = 90
        let mockTransform = CGAffineTransform(rotationAngle: .pi * 90 / 180)
        XCTAssertEqual(element.transform, mockTransform)
    }
    
}
