import Foundation

extension View {

    // MARK: - Managing color

    /// Sets whether this view should ignore the system Smart Invert setting.
    /// Use this modifier to suppress Smart Invert in a view that shouldn’t be inverted. Or pass an active argument of false to begin following the Smart Invert setting again when it was previously disabled.
    /// - Parameter active: A true value ignores the system Smart Invert setting. A false value follows the system setting.
    /// - Returns: The modified view.
    nonisolated public func accessibilityIgnoresInvertColors(_ active: Bool = true) -> some View {
        fatalError()
    }

    // MARK: - Enlarging content

    /// Adds a default large content view to be shown by the large content viewer.
    /// - Returns: The modified view.
    nonisolated public func accessibilityShowsLargeContentViewer() -> some View {
        fatalError()
    }

    /// Adds a custom large content view to be shown by the large content viewer. 
    /// - Returns: The modified view.
    nonisolated public func accessibilityShowsLargeContentViewer<V>(@ViewBuilder _ largeContentView: () -> V) -> some View where V : View {
        fatalError()
    }
}