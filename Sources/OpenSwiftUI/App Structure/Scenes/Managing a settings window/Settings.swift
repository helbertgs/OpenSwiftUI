//
// Settings.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A scene that presents an interface for viewing and modifying an app's
/// settings.
///
/// Use a settings scene to have OpenSwiftUI manage views with controls for your
/// app's settings when you declare your app using the ``App`` protocol.
/// When you use an ``App`` declaration for multiple platforms, compile the
/// settings scene only in Windows:
///
///     @main
///     struct MyApp: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView()
///             }
///             #if os(Windows)
///             Settings {
///                 SettingsView()
///             }
///             #endif
///         }
///     }
///
/// Passing a view as the argument to a settings scene in the ``App``
/// declaration causes OpenSwiftUI to enable the app's Settings menu item.
/// OpenSwiftUI manages displaying and removing the settings view when the user
/// selects the Settings item from the application menu or the equivalent
/// keyboard shortcut:
///
///  ![A screenshot of the MyApp application menu, showing the active
///   Settings menu from the addition of a settings scene to the app
///   declaration.](OpenSwiftUI-AppBehavior-Settings-AppMenu.png)
///
/// The contents of your settings view are controls that modify bindings
/// to ``UserDefaults`` values that OpenSwiftUI manages using the ``AppStorage`` property wrapper:
///
///     struct GeneralSettingsView: View {
///         @AppStorage("showPreview") private var showPreview = true
///         @AppStorage("fontSize") private var fontSize = 12.0
///
///         var body: some View {
///             Form {
///                 Toggle("Show Previews", isOn: $showPreview)
///                 Slider(value: $fontSize, in: 9...96) {
///                     Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
///                 }
///             }
///         }
///     }
///
/// You can define your settings in a single view, or you can use a ``TabView``
/// to group settings into different collections:
///
///     struct SettingsView: View {
///         var body: some View {
///             TabView {
///                 Tab("General", systemImage: "gear") {
///                     GeneralSettingsView()
///                 }
///                 Tab("Advanced", systemImage: "star") {
///                     AdvancedSettingsView()
///                 }
///             }
///             .scenePadding()
///             .frame(maxWidth: 350, minHeight: 100)
///         }
///     }
///
/// ![A screenshot showing a tabbed application settings view containing a
///   checkbox and a slider whose values are set with bindings and managed
///   by SwitfUI's app storage property
///   wrapper.](OpenSwiftUI-AppBehavior-Settings.png)
public struct Settings<Content> : Scene where Content : View {

    /// The content of the settings scene.
    ///
    /// - Parameter content: A view that represents the content of the scene.
    package let content: Content

    /// The content and behavior of the scene.
    ///
    /// For any scene that you create, provide a computed `body` property that
    /// defines the scene as a composition of other scenes. You can assemble a
    /// scene from built-in scenes that OpenSwiftUI provides, as well as other
    /// scenes that you've defined.
    ///
    /// Swift infers the scene's ``OpenSwiftUI/Scene/Body-swift.associatedtype``
    /// associated type based on the contents of the `body` property.
    @MainActor @preconcurrency public var body: Never { 
        fatalError()
     }

    // MARK: - Creating a settings scene.

    /// Creates a scene that presents an interface for viewing and modifying
    /// an app's preferences.
    ///
    /// Use `Settings(content:)` to add a preferences scene when you declare
    /// your app using the ``App`` protocol.
    ///
    /// The example below shows the view content for the settings scene
    /// added to the OpenSwiftUI app delegate:
    ///
    ///     @main
    ///     struct WindowsOpenSwiftUISnippets: App {
    ///         var body: some Scene {
    ///             WindowGroup {
    ///                 ContentView()
    ///             }
    ///             #if os(Windows)
    ///             Settings(content: {
    ///                 SettingsView()
    ///             }
    ///             #endif
    ///         }
    ///     }
    ///
    /// When you use an ``App`` declaration for multiple platforms,
    /// compile the settings scene only in Windows, as shown in the example above.
    ///
    /// - Parameter content: A view that represents the content of the scene.
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    /// Creates the settings scene's representation in the OpenSwiftUI scene graph.
    ///
    /// - Parameters:
    ///   - scene: The settings scene to create.
    ///   - inputs: The inputs for the scene.
    /// - Returns: The outputs for the scene.
    nonisolated public static func _makeScene(scene: _GraphValue<Settings<Content>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = _SceneOutputs()
        outputs.type = Self.self
        outputs.scene = scene.value
        outputs.environmentValues = inputs.environmentValues
        outputs.content = type(of: scene.value.content)._makeView(view: .init(scene.value.content), inputs: .init())

        return outputs
    }
}