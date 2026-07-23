//
// DismissWindowAction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// An action that dismisses a window associated to a particular scene.
///
/// Use the ``EnvironmentValues/dismissWindow`` environment value to get the
/// instance of this structure for a given ``Environment``. Then call the
/// instance to dismiss a window. You call the instance directly because it
/// defines a ``DismissWindowAction/callAsFunction(id:)`` method that Swift
/// calls when you call the instance.
///
/// For example, you can define a button that closes an auxiliary window:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///             }
///             #if os(Windows)
///             Window("Auxiliary", id: "auxiliary") {
///                 AuxiliaryContentView()
///             }
///             #endif
///         }
///     }
///
///     struct DismissWindowButton: View {
///         @Environment(\.dismissWindow) private var dismissWindow
///
///         var body: some View {
///             Button("Close Auxiliary Window") {
///                 dismissWindow(id: "auxiliary")
///             }
///         }
///     }
///
/// If the window was opened with ``EnvironmentValues/pushWindow``, the original
/// presenting will reappear when this action is performed.
@MainActor
public struct DismissWindowAction {

     /// The action to perform when the window is closed.
    let action: @MainActor @Sendable (String) -> Void

    /// Dismisses the current window.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it when you
    /// call the ``EnvironmentValues/dismissWindow`` action:
    ///
    ///     dismissWindow()
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations#Methods-with-Special-Names)
    /// in *The Swift Programming Language*.
    @MainActor public func callAsFunction() {
        fatalError("not implemented yet")
    }

    /// Dismisses the window that's associated with the specified identifier.
    ///
    /// When the specified identifier represents a ``WindowGroup``, all of the
    /// open windows in that group will be dismissed. For dismissing a single
    /// window associated to a `WindowGroup` scene, use
    /// ``dismissWindow(value:)`` or ``dismissWindow(id:value:)``.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it when you
    /// call the ``EnvironmentValues/dismissWindow`` action with an identifier:
    ///
    ///     dismissWindow(id: "message")
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations#Methods-with-Special-Names)
    /// in *The Swift Programming Language*.
    ///
    /// - Parameter id: The identifier of the scene to dismiss.
    @MainActor public func callAsFunction(id: String) {
        fatalError("not implemented yet")
    }

    /// Dismisses the window defined by the window group that is presenting the
    /// specified value type.
    ///
    /// If multiple windows match the provided value, then they all will be
    /// dismissed. For dismissing a specific window in a specific group, use
    /// ``dismissWindow(id:value:)``.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it when you
    /// call the ``EnvironmentValues/dismissWindow`` action with an identifier
    /// and a value:
    ///
    ///     dismissWindow(value: message.id)
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations#Methods-with-Special-Names)
    /// in *The Swift Programming Language*.
    ///
    /// - Parameters:
    ///   - value: The value which is currently presented.
    @MainActor public func callAsFunction<D>(value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError("not implemented yet")
    }

    /// Dismisses the window defined by the window group that is presenting the
    /// specified value type and that's associated with the specified identifier.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it when you
    /// call the ``EnvironmentValues/dismissWindow`` action with an identifier
    /// and a value:
    ///
    ///     dismissWindow(id: "message", value: message.id)
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations#Methods-with-Special-Names)
    /// in *The Swift Programming Language*.
    ///
    /// - Parameters:
    ///   - id: The identifier of the scene to dismiss.
    ///   - value: The value which is currently presented.
    @MainActor public func callAsFunction<D>(id: String, value: D) where D : Decodable, D : Encodable, D : Hashable {
        fatalError("not implemented yet")
    }
}

extension EnvironmentValues {

    /// A window dismissal action stored in a view's environment.
    ///
    /// Use the `dismissWindow` environment value to get an
    /// ``DismissWindowAction`` instance for a given ``Environment``. Then call
    /// the instance to dismiss a window. You call the instance directly because
    /// it defines a ``DismissWindowAction/callAsFunction(id:)`` method that
    /// Swift calls when you call the instance.
    ///
    /// For example, you can define a button that dismisses an auxiliary window:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             #if os(Windows)
    ///             Window("Auxiliary", id: "auxiliary") {
    ///                 AuxiliaryContentView()
    ///             }
    ///             #endif
    ///         }
    ///     }
    ///
    ///     struct DismissWindowButton: View {
    ///         @Environment(\.dismissWindow) private var dismissWindow
    ///
    ///         var body: some View {
    ///             Button("Close Auxiliary Window") {
    ///                 dismissWindow(id: "auxiliary")
    ///             }
    ///         }
    ///     }
    ///
    /// If the window was opened with ``EnvironmentValues/pushWindow``, the
    /// presenting window will reappear when this action is performed.
    public var dismissWindow: DismissWindowAction {
        get { self[DismissWindowActionKey.self] }
        set { self[DismissWindowActionKey.self] = newValue }
    }
}

struct DismissWindowActionKey : EnvironmentKey {
    static var defaultValue: DismissWindowAction {
        DismissWindowAction(action: { _ in }) 
    }
}

extension DismissWindowAction : @MainActor Equatable {
    public static func == (_ lhs: DismissWindowAction, _ rhs: DismissWindowAction) -> Bool {
        ObjectIdentifier(type(of: lhs.self)) == ObjectIdentifier(type(of: rhs.self))
    }
}