import Foundation

struct PlatformSystemDefinitionKey : EnvironmentKey {
    static var defaultValue: PlatformSystemDefinition {
        .none
    }
}

extension EnvironmentValues {
    var platformSystem: PlatformSystemDefinition {
        get { self[PlatformSystemDefinitionKey.self] }
        set { self[PlatformSystemDefinitionKey.self] = newValue }
    }
}