import Swift

@resultBuilder public struct SceneBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene {
        content
    }
}
