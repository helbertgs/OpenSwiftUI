import Swift

@frozen public struct ModifiedContent<Content, Modifier> {

    // MARK: - Type Alias.

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    public typealias Body = Never

    // MARK: - Public Property(ies).

    /// The content that the modifier transforms into a new view or new
    /// view modifier.
    public var content: Content

    /// The view modifier.
    public var modifier: Modifier

    // MARK: - Constructor(s).
    /// A structure that the defines the content and modifier needed to produce
    /// a new view or view modifier.
    ///
    /// If `content` is a ``View`` and `modifier` is a ``ViewModifier``, the
    /// result is a ``View``. If `content` and `modifier` are both view
    /// modifiers, then the result is a new ``ViewModifier`` combining them.
    ///
    /// - Parameters:
    ///     - content: The content that the modifier changes.
    ///     - modifier: The modifier to apply to the content.
    @inlinable public init(content: Content, modifier: Modifier) {
        self.content = content
        self.modifier = modifier
    }
}

extension ModifiedContent : Equatable where Content : Equatable, Modifier : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ModifiedContent<Content, Modifier>, rhs: ModifiedContent<Content, Modifier>) -> Bool {
        lhs.content == rhs.content && lhs.modifier == rhs.modifier
    }
}

extension ModifiedContent : View where Content : View {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    public var body: Never {
        fatalError()
    }

    public static func _makeView(view: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _ViewInputs) -> _ViewOutputs {
        Content._makeView(view: .init(view.value.content), inputs: inputs)
    }
}

extension ModifiedContent where Content : View, Modifier : ViewModifier {

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    public var body: ModifiedContent<Content, Modifier>.Body {
        fatalError()
    }
}

extension ModifiedContent : ViewModifier where Content : ViewModifier, Modifier : ViewModifier {
    /// Gets the current body of the caller.
    ///
    /// `content` is a proxy for the view that will have the modifier
    /// represented by `Self` applied to it.
    public func body(content: Self.Content) -> Self.Body {
        fatalError()
    }

    public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError()
    }

    public static func _makeViewList(modifier: _GraphValue<Self>, inputs: _ViewListInputs, body: @escaping (_Graph, _ViewListInputs) -> _ViewListOutputs) -> _ViewListOutputs {
        fatalError()
    }

    public static func _viewListCount(inputs: _ViewListCountInputs, body: (_ViewListCountInputs) -> Int?) -> Int? {
        nil
    }
}

extension ModifiedContent : Scene where Content : Scene, Modifier : _SceneModifier {

    // MARK: - Property(ies).
    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that OpenSwiftUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    public var body : Never { fatalError() }

    public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        let modified = Modifier._makeScene(modifier: .init(scene.value.modifier), inputs: inputs) { _, _ in
            _SceneOutputs()
        }
        let content = Content._makeScene(scene: .init(scene.value.content), inputs: inputs)

        return .init(props: [
            "modifier": modified,
            "content": content
        ])
    }
}

extension ModifiedContent where Content : Scene {
    public static func _makeScene(scene: _GraphValue<ModifiedContent<Content, Modifier>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
