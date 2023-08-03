import XCTest
@testable import ThenAnimatable

final class AnimatableStackViewTests: XCTestCase {
    
    var element = AnimatableStackView()
    
    override func setUp() {
        super.setUp()
        element = AnimatableStackView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableStackViewTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableStackViewTests: FillDesignableTests {
    
    func testFillColor() {
        // _testFillColor() // broken see issue #461
    }
    
    func testOpacity() {
        // _testOpacity() // broken see issue #461
    }
    
    func testPredefinedColor() {
        // _testPredefinedColor() // broken see issue #461
    }
    
    func test_predefinedColor() {
        _test_predefinedColor()
    }
    
}

// MARK: - RotationDesignable Tests

extension AnimatableStackViewTests: RotationDesignableTests {
    
    func testRotate() {
        _testRotate()
    }
    
}
