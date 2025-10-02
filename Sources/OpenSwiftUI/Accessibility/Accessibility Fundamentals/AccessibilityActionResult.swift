//import Foundation
//
//public struct AccessibilityActionResult {
//    public init() {
//    }
//}

import SwiftUI

@MainActor @available(macOS 13.0, *)
let window = SwiftUI.WindowGroup {
    SwiftUI.EmptyView()
}.commandsRemoved()
