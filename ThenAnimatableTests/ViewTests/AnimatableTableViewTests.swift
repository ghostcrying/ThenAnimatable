import XCTest
@testable import ThenAnimatable

final class AnimatableTableViewTests: XCTestCase {
    
    var element = AnimatableTableView()
    
    override func setUp() {
        super.setUp()
        element = AnimatableTableView()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}

// MARK: - FillDesignable Tests

extension AnimatableTableViewTests: FillDesignableTests {
    
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
