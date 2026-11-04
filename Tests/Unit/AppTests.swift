import Foundation
import Testing
@testable import OpenSwiftUI

@MainActor
class AppTests {
    @Test func main() {
        _TestApp.main()
        if let app = _TestApp.host {
            #expect(type(of: app.body) == Window<_TestView>.self)
        }
    }
}

struct _TestApp : App {
    
    let testView = _TestView()

    static var host: _TestApp?

    var body: some Scene {
        Window("test", id: "test") {
            testView
        }
    }

    static func main() {
        _TestApp.host = Self()
    }
}

struct _TestView: View {
    
    private var _view: AnyView
    var body: some View {
        _view
    }

    init() {
        _view = AnyView(EmptyView())
    }

    mutating func set<T>(view: T) where T : View {
        _view = AnyView(view)
    }
}
