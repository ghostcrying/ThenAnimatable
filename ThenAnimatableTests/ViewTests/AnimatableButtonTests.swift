import XCTest
@testable import ThenAnimatable

final class AnimatableButtonTests: XCTestCase {
    
    var element = AnimatableButton()
    
    override func setUp() {
        super.setUp()
        element = AnimatableButton()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableButtonTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableButtonTests: FillDesignableTests {
    
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
