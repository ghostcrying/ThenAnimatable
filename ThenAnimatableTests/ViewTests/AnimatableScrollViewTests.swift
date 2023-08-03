import XCTest
@testable import ThenAnimatable

final class AnimatableScrollViewTests: XCTestCase {
    
    var element = AnimatableScrollView()
    
    override func setUp() {
        super.setUp()
        element = AnimatableScrollView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableScrollViewTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableScrollViewTests: FillDesignableTests {
    
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

extension AnimatableScrollViewTests: RotationDesignableTests {
    
    func testRotate() {
        _testRotate()
    }
    
}
