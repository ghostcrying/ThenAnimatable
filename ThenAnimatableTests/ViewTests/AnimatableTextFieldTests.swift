import XCTest
@testable import ThenAnimatable

class AnimatableTextFieldTests: XCTestCase {
    
    var element = AnimatableTextField()
    
    override func setUp() {
        super.setUp()
        element = AnimatableTextField()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableTextFieldTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableTextFieldTests: FillDesignableTests {
    
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

// MARK: - PaddingDesignable Tests

extension AnimatableTextFieldTests: PaddingDesignableTests {
    
    func testPaddingLeft() {
        _testPaddingLeft()
    }
    
    func testPaddingRight() {
        _testPaddingRight()
    }
    
    func testPaddingSide() {
        _testPaddingSide()
    }
    
}
