@testable import OpenSwiftUI

struct AppMock : App {

    // MARK: - Internal Property(ies).

    var isCalledInit: Bool = false
    static var isCalledMain: Bool = false

    // MARK: - App Property(ies).

    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }

    // MARK: - App Constructor(s).
    
    init() {
        isCalledInit = true
    }
    
    // MARK: - App Static Function(s).

    static func main() {
        isCalledMain = true
    }
}