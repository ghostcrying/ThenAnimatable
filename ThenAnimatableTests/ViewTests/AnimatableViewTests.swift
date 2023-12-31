import XCTest
@testable import ThenAnimatable

final class AnimatableViewTests: XCTestCase {
    
    var element = AnimatableView()
    
    override func setUp() {
        super.setUp()
        element = AnimatableView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableViewTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableViewTests: FillDesignableTests {
    
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

extension AnimatableViewTests: RotationDesignableTests {
    
    func testRotate() {
        _testRotate()
    }
    
}
