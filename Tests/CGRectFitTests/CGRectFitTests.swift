import XCTest
import CGRectFit

final class CGRectFitTests: XCTestCase {
    func testExample() {
        let superview: View = View(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        let subview: View = View(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        // aspect fit
        subview.frame.fit(to: superview.bounds)
        
        XCTAssertEqual(subview.frame.origin.x, 150)
        XCTAssertEqual(subview.frame.origin.y, 100)
        XCTAssertEqual(subview.frame.size.width, 100)
        XCTAssertEqual(subview.frame.size.width, 100)
        
        // aspect fill
        subview.frame.fill(superview.bounds)

        XCTAssertEqual(subview.frame.origin.x, 100)
        XCTAssertEqual(subview.frame.origin.y, 50)
        XCTAssertEqual(subview.frame.size.width, 200)
        XCTAssertEqual(subview.frame.size.width, 200)
    }
    
    func testUsage() {
        do {
            // Static methods
            let size = CGSize(width: 200, height: 100)
            let aspectFit = CGSize.fitting(to: size, ofAspectRatio: 1)
            let aspectFill = CGSize.filling(size, ofAspectRatio: 1)
            
            XCTAssertEqual(aspectFit, CGSize(width: 100, height: 100))
            XCTAssertEqual(aspectFill, CGSize(width: 200, height: 200))
        }
        
        do {
            // Methods
            let size1 = CGSize(width: 10, height: 10)
            let size2 = CGSize(width: 200, height: 100)
            let aspectFit = size1.fitting(to: size2)
            let aspectFill = size1.filling(size2)
            
            XCTAssertEqual(aspectFit, CGSize(width: 100, height: 100))
            XCTAssertEqual(aspectFill, CGSize(width: 200, height: 200))
        }
        
        do {
            // `mutating func`
            var size1 = CGSize(width: 10, height: 10)
            let size2 = CGSize(width: 200, height: 100)
            
            size1.fit(to: size2)
            XCTAssertEqual(size1, CGSize(width: 100, height: 100))

            size1.fill(size2)
            XCTAssertEqual(size1, CGSize(width: 200, height: 200))
        }
        
        do {
            // Static methods
            let rect = CGRect(x: 100, y: 100, width: 200, height: 100)
            let aspectFit = CGRect.fitting(to: rect, ofAspectRatio: 1)
            let aspectFill = CGRect.filling(rect, ofAspectRatio: 1)
            
            XCTAssertEqual(aspectFit, CGRect(x: 150, y: 100, width: 100, height: 100))
            XCTAssertEqual(aspectFill, CGRect(x: 100, y: 50, width: 200, height: 200))
        }
        
        do {
            // Methods
            let rect1 = CGRect(x: 0, y: 0, width: 10, height: 10)
            let rect2 = CGRect(x: 100, y: 100, width: 200, height: 100)
            let aspectFit = rect1.fitting(to: rect2)
            let aspectFill = rect1.filling(rect2)
            
            XCTAssertEqual(aspectFit, CGRect(x: 150, y: 100, width: 100, height: 100))
            XCTAssertEqual(aspectFill, CGRect(x: 100, y: 50, width: 200, height: 200))
        }
        
        do {
            // `mutating func`
            var rect1 = CGRect(x: 0, y: 0, width: 10, height: 10)
            let rect2 = CGRect(x: 100, y: 100, width: 200, height: 100)
            
            rect1.fit(to: rect2)
            XCTAssertEqual(rect1, CGRect(x: 150, y: 100, width: 100, height: 100))
            
            rect1.fill(rect2)
            XCTAssertEqual(rect1, CGRect(x: 100, y: 50, width: 200, height: 200))
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

private class View {
    var frame: CGRect
    var bounds: CGRect {
        get { frame }
        set { frame = newValue }
    }
    
    init(frame: CGRect) {
        self.frame = frame
    }
}
