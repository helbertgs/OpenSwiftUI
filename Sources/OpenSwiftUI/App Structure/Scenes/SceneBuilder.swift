import Swift

@resultBuilder public struct SceneBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene {
        content
    }

    @_alwaysEmitIntoClient
    /// Builds a scene from multiple contents.
    ///
    /// - Parameter content: The contents to build the scene from.
    /// - Returns: A scene built from the contents.
    public static func buildBlock<each Content>(_ content: repeat each Content) -> _TupleScene<(repeat each Content)> where repeat each Content : Scene {
        .init((repeat each content))
    }
}
