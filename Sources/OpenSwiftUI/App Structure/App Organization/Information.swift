import Foundation



extension Application {
    struct SceneConfiguration {
        let name: String?
        let `class`: String?
        let delegate: String?
    }
}

extension Application.SceneConfiguration : Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "SceneConfigurationName"
        case `class` = "SceneClassName"
        case delegate = "SceneDelegateClassName"
    }
}

extension Application {
    struct SceneManifest {
        let supportsMultipleScenes: Bool?
        let configuration: [String: [Application.SceneConfiguration]]?
    }
}

extension Application.SceneManifest : Decodable {
    enum CodingKeys: String, CodingKey {
        case supportsMultipleScenes = "ApplicationSupportsMultipleScenes"
        case configuration = "SceneConfigurations"
    }
}

extension Application {
    struct Information {
        let scene: Application.SceneManifest?
        let principalClass: String?
    }
}

extension Application.Information : Decodable {
    enum CodingKeys: String, CodingKey {
        case scene = "ApplicationSceneManifest"
        case principalClass = "PrincipalClass"
    }
}
