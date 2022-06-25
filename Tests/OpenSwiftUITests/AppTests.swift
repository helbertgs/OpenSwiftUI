@testable import OpenSwiftUI
import XCTest

class AppTests: XCTestCase {

    func testAppInit() throws {
        let app = AppMock()
        XCTAssertTrue(app.isCalledInit)
    }

    func testAppMain() throws {
        AppMock.main()
        XCTAssertTrue(AppMock.isCalledInit)
    }
}
