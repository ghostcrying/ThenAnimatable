import XCTest
@testable import ThenAnimatable

final class AnimatableLabelTests: XCTestCase {
    
    var element = AnimatableLabel()
    
    override func setUp() {
        super.setUp()
        element = AnimatableLabel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableLabelTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableLabelTests: FillDesignableTests {
    
    func testFillColor() {
        _testFillColor()
    }
    
    func testOpacity() {
        _testOpacity()
    }
    
    func testPredefinedColor() {
        _testPredefinedColor()
    }
    
    func test_predefinedColor() {
        _test_predefinedColor()
    }
    
}

// MARK: - RotationDesignable Tests

extension AnimatableLabelTests: RotationDesignableTests {
    
    func testRotate() {
        _testRotate()
    }
    
}
