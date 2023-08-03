import XCTest
@testable import ThenAnimatable
final class BorderTypeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBorderType() {
        let types: [String: BorderType] = [
            "solid": .solid,
            "dash": .dash(dashLength: 1, spaceLength: 1),
            "dash(10)": .dash(dashLength: 10, spaceLength: 1),
            "dash(10,10)": .dash(dashLength: 10, spaceLength: 10),
            "dash(10+10,10)": .dash(dashLength: 20, spaceLength: 10)
        ]
        
        for (string, expected) in types {
            let value = BorderType(string: string)
            XCTAssertEqual("\(value)", "\(expected)", string) // test string if `AnimationType` not equatable
        }
    }
    
}
