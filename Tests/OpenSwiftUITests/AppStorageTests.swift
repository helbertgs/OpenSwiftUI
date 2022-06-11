@testable import OpenSwiftUI
import SwiftUI
import XCTest

class AppStorageTests: XCTestCase {

    struct MyApp: SwiftUI.App {
        @available(iOS 14.0, *)
        var body: some SwiftUI.Scene {
            SwiftUI.WindowGroup {
                SwiftUI.EmptyView()
            }.defaultAppStorage(UserDefaults.standard)
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        if #available(iOS 14.0, *) {
            let myApp = MyApp()
//            MyApp.main()
            print(myApp.body)
            let env = SwiftUI.EnvironmentValues()
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
