import Swift

public protocol Scene {

    // MARK: - Associated Type(s).

    associatedtype Body : Scene

    // MARK: - Property(ies).

    @SceneBuilder var body: Self.Body { get }
}

extension Scene {
    private func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(self, modifier)
    }
}

extension Scene {
    /// Sets the style for windows created by this scene.
    public func windowStyle<S>(_ style: S) -> some Scene where S : WindowStyle {
        modifier(style)
    }

    /// Sets the style for the toolbar defined within this scene.
    public func windowToolbarStyle<S>(_ style: S) -> some Scene where S : WindowToolbarStyle {
        modifier(style)
    }
}
