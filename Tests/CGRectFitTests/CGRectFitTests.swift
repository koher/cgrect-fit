import XCTest
@testable import CGRectFit

final class CGRectFitTests: XCTestCase {
    func testExample() {
        let rect1 = CGRect(x: 100, y: 100, width: 200, height: 100)
        let rect2 = CGRect(x: 0, y: 0, width: 10, height: 10)
        let aspectFit = rect2.fitting(to: rect1)
        print(aspectFit) // (x: 150.0, y: 100.0, width: 100.0, height: 100.0)
        
        XCTAssertEqual(aspectFit.origin.x, 150)
        XCTAssertEqual(aspectFit.origin.y, 100)
        XCTAssertEqual(aspectFit.size.width, 100)
        XCTAssertEqual(aspectFit.size.width, 100)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
