//
// ContainerBackgroundTraitKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 16, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

struct ContainerBackgroundTraitKey : _ViewTraitKey {
    static var defaultValue: AnyView? {
        nil
    }
}

extension View {

    /// Sets the container background of the enclosing container using a view.
    ///
    /// The following example uses a ``LinearGradient`` as a background:
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             NavigationStack {
    ///                 List {
    ///                     NavigationLink("Blue") {
    ///                         Text("Blue")
    ///                         .containerBackground(.blue.gradient, for: .navigation)
    ///                     }
    ///                     NavigationLink("Red") {
    ///                         Text("Red")
    ///                         .containerBackground(.red.gradient, for: .navigation)
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The `.containerBackground(_:for:)` modifier differs from the
    /// ``View/background(_:ignoresSafeAreaEdges:)`` modifier by automatically
    /// filling an entire parent container. ``ContainerBackgroundPlacement``
    /// describes the available containers.
    ///
    /// - Parameters
    ///   - style: The shape style to use as the container background.
    ///   - container: The container that will use the background.
    public func containerBackground<S>(
        _ style: S,
        for container: ContainerBackgroundPlacement
    ) -> some View where S : ShapeStyle {
        self
    }

    /// Sets the container background of the enclosing container using a view.
    ///
    /// The following example uses a custom ``View`` as a background:
    ///
    ///     struct ContentView: View {
    ///         var body: some View {
    ///             NavigationStack {
    ///                 List {
    ///                     NavigationLink("Image") {
    ///                         Text("Image")
    ///                         .containerBackground(for: .navigation) {
    ///                             Image(name: "ImageAsset")
    ///                         }
    ///                     }
    ///                 }
    ///             }
    ///         }
    ///     }
    ///
    /// The `.containerBackground(for:alignment:content:)` modifier differs from
    /// the ``View/background(_:ignoresSafeAreaEdges:)`` modifier by
    /// automatically filling an entire parent container.
    /// ``ContainerBackgroundPlacement`` describes the available containers.
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the
    ///     implicit ``ZStack`` that groups the background views. The default is
    ///     ``Alignment/center``.
    ///   - container: The container that will use the background.
    ///   - content: The view to use as the background of the container.
    public func containerBackground<V>(
        for container: ContainerBackgroundPlacement,
        alignment: Alignment = .center,
        ViewBuilder content: () -> V
    ) -> some View where V : View {
        self
    }
}
