//
// View.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenCombine

/// A type that represents part of your app's user interface and provides
/// modifiers that you use to configure views.
///
/// You create custom views by declaring types that conform to the `View`
/// protocol. Implement the required ``View/body-swift.property`` computed
/// property to provide the content for your custom view.
///
///     struct MyView: View {
///         var body: some View {
///             Text("Hello, World!")
///         }
///     }
///
/// Assemble the view's body by combining one or more of the primitive views
/// provided by OpenSwiftUI, like the ``Text`` instance in the example above, plus
/// other custom views that you define, into a hierarchy of views. For more
/// information about creating custom views, see <doc:Declaring-a-Custom-View>.
///
/// The `View` protocol provides a set of modifiers — protocol
/// methods with default implementations — that you use to configure
/// views in the layout of your app. Modifiers work by wrapping the
/// view instance on which you call them in another view with the specified
/// characteristics, as described in <doc:Configuring-Views>.
/// For example, adding the ``View/opacity(_:)`` modifier to a
/// text view returns a new view with some amount of transparency:
///
///     Text("Hello, World!")
///         .opacity(0.5) // Display partially transparent text.
///
/// The complete list of default modifiers provides a large set of controls
/// for managing views.
/// For example, you can fine tune <doc:View-Layout>,
/// add <doc:View-Accessibility> information,
/// and respond to <doc:View-Input-and-Events>.
/// You can also collect groups of default modifiers into new,
/// custom view modifiers for easy reuse.
@_typeEraser(DebugReplaceableView) 
@_typeEraser(AnyView) 
@MainActor @preconcurrency public protocol View {

    // MARK: - Associated Type(s).
    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
    associatedtype Body: View

    // MARK: - Public Property(ies).

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of primitive views that OpenSwiftUI provides, plus other
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
    @ViewBuilder @MainActor @preconcurrency var body: Self.Body { get }

    /// Builds the view outputs for this view within the attribute graph.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The view inputs propagated from the parent context.
    /// - Returns: The `_ViewOutputs` produced for this view.
    @MainActor @preconcurrency static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs

    /// Builds the list of view elements this view contributes to a container.
    ///
    /// Most views contribute exactly one element (themselves). Views like
    /// `ForEach` override this to contribute N elements, one per data item.
    /// Containers (`VStack`, `HStack`) call this instead of `_makeView` when
    /// assembling their child lists, so a `ForEach` inside a stack expands
    /// into its individual rows rather than appearing as a single opaque node.
    ///
    /// - Parameters:
    ///   - view: The graph value wrapping this view instance.
    ///   - inputs: The list inputs propagated from the parent container.
    /// - Returns: The `_ViewListOutputs` contributed by this view.
    static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs

    /// Returns the static element count this view contributes to a container,
    /// or `nil` when the count is only known at runtime.
    ///
    /// Containers use this before constructing any child nodes to pre-allocate
    /// layout slots. `ForEach` returns its data array's count; tuple views
    /// return a compile-time constant; most single views return `1`.
    /// Returning `nil` signals that the count is dynamic and the container
    /// must fall back to building the list first.
    ///
    /// - Parameter inputs: The count inputs carrying the active environment.
    /// - Returns: The static element count, or `nil` if unknown at this point.
    static func _viewListCount(inputs: _ViewListCountInputs) -> Int?
}

extension View {

    public static func _makeView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        guard Body.self != Never.self else {
            fatalError("\(Self.self) must implement _makeView directly (Body == Never)")
        }
        guard let graph = _GraphContext.current else {
            fatalError("_makeView called outside of _GraphContext.withGraph")
        }

        let bodyAttr = graph.rule(name: "\(Self.self).body") {
            let prevEnv = graph.currentEnvironment
            graph.currentEnvironment = inputs.environment.projectedValue
            defer { graph.currentEnvironment = prevEnv }

            let instance = view.wrappedValue
            for child in Mirror(reflecting: instance).children {
                if var dp = child.value as? DynamicProperty {
                    dp.update()
                }
            }
            return instance.body
        }

        return Body._makeView(view: _GraphValue(attribute: bodyAttr), inputs: inputs)
    }

    /// Default implementation: delegates to `_makeView` and wraps its list.
    ///
    /// Single-element views (everything except `ForEach`) inherit this: they
    /// build their full outputs via `_makeView` and expose the same view list
    /// through the list API, so containers can treat all children uniformly.
    public static func _makeViewList(view: _GraphValue<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        guard let graph = _GraphContext.current else {
            fatalError("_makeViewList called outside of _GraphContext.withGraph")
        }

        let txAttr = graph.input(name: "transaction", Transaction())
        var viewInputs = _ViewInputs(
            frame: inputs.frame.projectedValue,
            environment: inputs.environment.projectedValue,
            transaction: txAttr
        )
        viewInputs.gestureHandler = inputs.gestureHandler
        let outputs = _makeView(view: view, inputs: viewInputs)

        return _ViewListOutputs(viewList: outputs.viewList)
    }

    /// Default implementation: every plain view contributes exactly one element.
    public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? { 1 }
}

extension View where Self.Body == Never {
    public var body : Never {
        fatalError("Never view has no body")
    }
}

extension View {
    /// Applies a modifier to a view and returns a new view.
    ///
    /// Use this modifier to combine a ``View`` and a ``ViewModifier``, to
    /// create a new view. For example, if you create a view modifier for
    /// a new kind of caption with blue text surrounded by a rounded rectangle:
    ///
    ///     struct BorderedCaption: ViewModifier {
    ///         func body(content: Content) -> some View {
    ///             content
    ///                 .font(.caption2)
    ///                 .padding(10)
    ///                 .overlay(
    ///                     RoundedRectangle(cornerRadius: 15)
    ///                         .stroke(lineWidth: 1)
    ///                 )
    ///                 .foregroundColor(Color.blue)
    ///         }
    ///     }
    ///
    /// You can use ``modifier(_:)`` to extend ``View`` to create new modifier
    /// for applying the `BorderedCaption` defined above:
    ///
    ///     extension View {
    ///         func borderedCaption() -> some View {
    ///             modifier(BorderedCaption())
    ///         }
    ///     }
    ///
    /// Then you can apply the bordered caption to any view:
    ///
    ///     Image(systemName: "bus")
    ///         .resizable()
    ///         .frame(width:50, height:50)
    ///     Text("Downtown Bus")
    ///         .borderedCaption()
    ///
    /// ![A screenshot showing the image of a bus with a caption reading
    /// Downtown Bus. A view extension, using custom a modifier, renders the
    ///  caption in blue text surrounded by a rounded
    ///  rectangle.](OpenSwiftUI-View-ViewModifier.png)
    ///
    /// - Parameter modifier: The modifier to apply to this view.
    @MainActor @preconcurrency public func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T> {
        .init(content: self, modifier: modifier)
    }
}

extension View {

    /// Adds an action to perform before this view appears.
    ///
    /// The exact moment that OpenSwiftUI calls this method
    /// depends on the specific view type that you apply it to, but
    /// the `action` closure completes before the first
    /// rendered frame appears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` before it appears.
    @inlinable public func onAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(_AppearanceActionModifier(appear: action))
    }

    /// Adds an action to perform after this view disappears.
    ///
    /// The exact moment that OpenSwiftUI calls this method
    /// depends on the specific view type that you apply it to, but
    /// the `action` closure doesn't execute until the view
    /// disappears from the interface.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` after it disappears.
    @inlinable public func onDisappear(perform action: (() -> Void)? = nil) -> some View {
        modifier(_AppearanceActionModifier(disappear: action))
    }
}

extension View {
    @inlinable public func environment<V>(_ keyPath: WritableKeyPath<EnvironmentValues, V>, _ value: V) -> some View {
        modifier(_EnvironmentKeyWritingModifier(keyPath: keyPath, value: value))
    }

//    @inlinable public func environmentObject<T>(_ object: T) -> some View where T : OpenCombine.ObservableObject {
//        environment(T.environmentStore, object)
//    }
}

extension View {
    @inlinable public func onChange<V>(of value: V, perform action: @escaping (_ newValue: V) -> Void) -> some View where V : Equatable {
        modifier(_ValueActionModifier(value: value, action: action))
    }
}

extension View {

    /// Sets the container shape to use for any container relative shape
    /// within this view.
    ///
    /// The example below defines a view that shows its content with a rounded
    /// rectangle background and the same container shape. Any
    /// ``ContainerRelativeShape`` within the `content` matches the rounded
    /// rectangle shape from this container inset as appropriate.
    ///
    ///     struct PlatterContainer<Content: View> : View {
    ///         @ViewBuilder var content: Content
    ///         var body: some View {
    ///             content
    ///                 .padding()
    ///                 .containerShape(shape)
    ///                 .background(shape.fill(.background))
    ///         }
    ///         var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
    ///     }
    ///
    /// - SeeAlso: ``View/containerShape(_:)-(RoundedRectangularShape)``
    @inlinable public func containerShape<T>(_ shape: T) -> some View where T : InsettableShape {
        modifier(_ContainerShapeModifier(shape: shape))
    }

    /// Sets the container shape to use for any container relative shape or
    /// concentric rectangle within this view.
    ///
    /// The example below defines a view that shows its content with a rounded
    /// rectangle background and the same container shape. Any
    /// ``ContainerRelativeShape`` within the `content` matches the rounded
    /// rectangle shape from this container inset as appropriate. Any
    /// ``ConcentricRectangle`` within the `content` will match the corners to
    /// be concentric to the container corners.
    ///
    ///     struct PlatterContainer<Content: View> : View {
    ///         @ViewBuilder var content: Content
    ///         var body: some View {
    ///             content
    ///                 .padding()
    ///                 .containerShape(shape)
    ///                 .background(shape.fill(.background))
    ///         }
    ///         var shape: RoundedRectangle { RoundedRectangle(cornerRadius: 20) }
    ///     }
    ///
    /// - SeeAlso: ``View/containerShape(_:)-(T)``
    @inlinable public func containerShape(_ shape: some RoundedRectangularShape) -> some View {
        modifier(_ContainerShapeModifier(shape: shape))
    }
}
