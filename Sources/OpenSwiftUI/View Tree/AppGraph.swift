import Foundation
/// AppKitApplication -> AppGraph (AppDelegate and AGGraphStorage-> Clousure
@MainActor
class AppGraph {
    
    // MARK: - Property(ies).
    
    var data: (any App)!
    lazy var makeRootScene: RootScene = {
        .init(context: {
            self._rootSceneList.forEach {
                self.run($0)
            }
        })
    }()
    
    var observers: [NSKeyValueObservation] = []
    var _rootScenePhase: ScenePhase = .inactive
    var _rootSceneList: [any Scene] = []
//    var _primarySceneSummaries: [Any] = []
//    var _focusStore: Any? = nil
//    var _sceneKeyboardShortcuts: [KeyboardShortcuts] = []
    var _rootCommandsList: [any Commands] = []
    var _launchProfileOptions: [Application.LaunchOptionsKey] = []
    
    // MARK: - Constructor(s).
    
    public init() {
        #if os(macOS)
        if let app = AppKitApplication.app {
            _rootSceneList.append(app.body)
        }
        #endif
        loadPropertyFile()
    }
    
    func run<T>(_ t: T) where T : Scene {
        let _ = T._makeScene(scene: _GraphValue(t), inputs: .init())
    }
    
    // MARK: - Function(s).
    
    func loadPropertyFile() {
        var information: Application.Information?
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
           let contents = FileManager.default.contents(atPath: path) {
            information = try? PropertyListDecoder().decode(Application.Information.self, from: contents)
            print(information ?? "No data found!")
        }
    }
}

@MainActor
class RootScene {
    
    // MARK: - Property(ies).
    
    var context: () -> Void
    
    // MARK: - Constructor(s).
    
    public init(context: @escaping () -> Void) {
        self.context = context
    }
}
