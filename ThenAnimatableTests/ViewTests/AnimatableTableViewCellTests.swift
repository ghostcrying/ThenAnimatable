import XCTest
@testable import ThenAnimatable

final class AnimatableTableViewCellTests: XCTestCase {
    
    var element = AnimatableTableViewCell()
    
    override func setUp() {
        super.setUp()
        element = AnimatableTableViewCell()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - CornerDesignable Tests

extension AnimatableTableViewCellTests: CornerDesignableTests {
    
    func testCornerRadius() {
        _testCornerRadius()
    }
    
    func test_cornerSides() {
        _test_cornerSides()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableTableViewCellTests: FillDesignableTests {
    
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
