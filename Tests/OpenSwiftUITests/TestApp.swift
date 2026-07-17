import Testing
// @testable import OpenSwiftUI
import SwiftUI

class TestApp {
    @Test func testApp() {
        // let app =  __App.run(EmptyView())

        // dump(app)
    }
}

struct TestView: View {
    var body: some View {
        Rectangle()
    }
}

extension __App {
    static func mirror() {
        Mirror(reflecting: ObjectIdentifier(__App.self)).children.forEach { child in
            print("Child: \(child.label ?? "nil") - \(child.value), type: \(type(of: child.value))")
        }
    }
}