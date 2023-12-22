#if canImport(UIKit) || os(iOS)
import UIKit

public class SceneBridge {
    // let activationConditionsPreferenceSeed: VersionSeed
    // let enqueuedEvents: [String: Any]
    let rootViewController: UIHostingController<EmptyView>
    let scene: UIWindowScene
//    let sceneBridgePublishers: [String: Any]
//    let titleSeedTracker: VersionSeedTracker<NavigationTitleKey>
//    let userActivityPreferenceSeed: VersionSeed
//    let validTestCases: [Any]
    
    
    public init(rootViewController: UIHostingController<EmptyView>, scene: UIWindowScene) {
        self.rootViewController = rootViewController
        self.scene = scene
    }
}

#endif
