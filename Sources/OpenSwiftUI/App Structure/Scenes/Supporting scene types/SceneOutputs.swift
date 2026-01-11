import Foundation
import OpenSpatial

/// The outputs of a scene.
public struct _SceneOutputs {

    // MARK: - Checking characteristics

    /// The identifier of the scene.
    var id: String = UUID().uuidString

    /// The type of the scene.
    var type: String

    /// The scene that this output represents.
    var scene: any Scene

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues 

    /// The modifiers applied to the scene.
    var modifiers: [any SceneModifier]

    /// The child scenes of this scene output.
    var children: [_SceneOutputs]

    /// The content view of the scene, if applicable.
    var content: _ViewOutputs? = nil

    /// The title of the scene.
    var title: String

    /// The size of the scene.
    var size: Size3D 

    /// The position of the scene.
    var position: UnitPoint

    // MARK: - Creating a scene output

    /// Creates a scene output with the given inputs.
    ///
    /// - Parameter type: The type of the scene.
    /// - Parameter inputs: The inputs for the scene.
    /// - Parameter scene: The scene that this output represents.
    /// - Parameter environmentValues: The environment values for the scene.
    /// - Parameter modifiers: The modifiers applied to the scene.
    /// - Parameter children: The child scenes of this scene output.
    /// - Parameter content: The content view of the scene, if applicable.
    /// - Parameter title: The title of the scene.
    /// - Parameter size: The size of the scene.
    package init(
        _ type: String, 
        inputs: _SceneInputs, 
        scene: any Scene, 
        environmentValues: EnvironmentValues, 
        modifiers: [any SceneModifier] = [], 
        children: [_SceneOutputs] = [], 
        content: _ViewOutputs? = nil,
        title: String = "", 
        size: Size3D = Size3D(width: 900, height: 450, depth: 0), 
        position: UnitPoint = .center
    ) {
        self.type = type
        self.scene = scene
        self.environmentValues = environmentValues
        self.modifiers = modifiers
        self.children = children
        self.content = content
        self.title = title
        self.size = size
        self.position = position
    }
}
