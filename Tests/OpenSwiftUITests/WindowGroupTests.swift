@testable import OpenSwiftUI
import XCTest

class AppStorageTests: XCTestCase {

    struct MyApp: App {
        var body: some Scene {
            WindowGroup {
                EmptyView()
            }
        }
    }

    func testMain() throws {
        var inputs = _SceneInputs()
        inputs.application = UIApplicationAdapter()
        inputs.role = UISceneSession.Role.windowApplication

        let windowGroup = WindowGroup { EmptyView() }
        let outputs = WindowGroup<EmptyView>._makeScene(scene: _GraphValue(windowGroup), inputs: inputs)
        let sut: UISceneConfiguration = outputs.config

        let expectedValue = UISceneConfiguration(name: nil, sessionRole: inputs.role)
        expectedValue.delegateClass = UISceneAdapter.self

        XCTAssertEqual(sut, expectedValue)
        XCTAssertEqual(String(describing: sut.delegateClass), String(describing: expectedValue.delegateClass))
    }
}
