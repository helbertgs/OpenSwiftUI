import Foundation
import OpenSpatial

public typealias _SceneOutputs = _SceneData
public typealias _SceneInputs = _SceneData

/// The outputs of a scene.
@MainActor @preconcurrency 
public struct _SceneData {

    // MARK: - Checking characteristics

    /// The identifier of the scene.
    var id: String = UUID().uuidString

    /// The type of the scene.
    var type: String = ""

    var title: String = ""

    /// The scene that this output represents.
    var scene: (any Scene)? = nil

    // MARK: - Creating background tasks

    /// The background tasks for the scene.
    var backgroundTasks: [Task<Void, Never>] = []

    // MARK: - Managing app storage

    /// The app storage for the scene.
    var appStorage: UserDefaults = .standard

    // MARK: - Setting commands

    // MARK: - Sizing and positioning the scene

    /// The position of the scene.
    var position: Point3D = .zero

    /// The size of the scene.
    var size: Size3D = .init(width: 900, height: 450)

    /// The ideal size of the scene.
    var idealSize: Size3D = .zero

    /// The placement of the scene.
    var placement: WindowPlacement = .init()

    /// The resizability of the scene.
    var resizability: WindowResizability = .contentSize

    /// The manage role of the scene.
    var manageRole: WindowManagerRole = .automatic

    // MARK: - Configuring scene visibility

    /// The launch behavior of the scene.
    var launchBehavior: SceneLaunchBehavior = .automatic

    /// The restoration behavior of the scene.
    var restorationBehavior: SceneRestorationBehavior = .automatic

    // MARK: - Styling the scene

    /// The style of the scene.
    var style: any WindowStyle = DefaultWindowStyle()

    /// The toolbar style of the scene.
    var windowToolbarStyle: any WindowToolbarStyle = .automatic

    var toolbarLabelStyle: ToolbarLabelStyle = .automatic

    var menuBarExtraStyle: MenuBarExtraStyle = .automatic

    // MARK: - Managing the environment

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues = .init()

    // MARK: - Interacting with dialogs

    /// The icon of the dialog.
    var dialogIcon: Any? = nil

    /// The severity of the dialog.
    var dialogSeverity: DialogSeverity = .automatic

    // MARK: - Managing Hierarchical Relationships

    /// The children of the scene.
    var children: [_SceneOutputs] = []

    var content: _ViewOutputs? = nil
}