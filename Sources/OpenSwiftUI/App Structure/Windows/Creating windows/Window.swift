//
// Window.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A scene that presents its content in a single, unique window.
///
/// Use a `Window` scene to augment the main interface of your app
/// with a window that gives people access to supplemental functionality.
/// For example, you can create a secondary window in a mail reader app that
/// enables people to view the status of their account connections:
///
///      @main
///      struct Mail: App {
///          var body: some Scene {
///              WindowGroup {
///                  MailViewer()
///              }
///              Window("Connection Doctor", id: "connection-doctor") {
///                  ConnectionDoctor()
///              }
///          }
///      }
///
/// Provide a title as the first argument to the window's intializer.
/// The system uses the title to identify the window to people using your app
/// in the window's title bar or in the list of available singleton windows
/// that the Windows menu displays automatically.
///
/// > Note: You can override the title in the window's title bar by adding
///   one of the ``View/navigationTitle(_:)`` view modifiers to the
///   window's content. This enables you to dynamically update the title bar.
///
///
/// - Note: In visionOS, Windows that you create using ``Window`` don't support
///   the volumetric window style.
///
/// ### Open a window programmatically
///
/// People open the window by selecting it in the Windows menu, but you can also
/// open the window programmatically using the ``EnvironmentValues/openWindow``
/// action that you read from the environment. Use the `id` parameter that you
/// initialize the window with to indicate which window to open. For example,
/// you can create a button to open the window from the previous example:
///
///     struct OpenConnectionDoctorButton: View {
///         @Environment(\.openWindow) private var openWindow
///
///         var body: some View {
///             Button("Connection doctor") {
///                 openWindow(id: "connection-doctor") // Match the window's identifier.
///             }
///         }
///     }
///
/// If the window is already open when you call this action, the action brings
/// the open window to the front. Be sure to use unique identifiers across all
/// of the `Window` and ``WindowGroup`` instances that you define.
///
/// ### Dismiss a window programmatically
///
/// The system provides people with controls to close windows, but you can also
/// close a window programmatically using the ``EnvironmentValues/dismiss``
/// action from within the window's view hierarchy. For example, you can
/// include a button in the connection doctor view that dismisses the view:
///
///     struct ConnectionDoctor: View {
///         @Environment(\.dismiss) private var dismiss
///
///         var body: some View {
///             VStack {
///                 // ...
///
///                 Button("Dismiss") {
///                     dismiss()
///                 }
///             }
///         }
///     }
///
/// The dismiss action doesn't close the window if you call it from a
/// modal --- like a sheet or a popover --- that you present from within
/// the window. In that case, the action dismisses the modal presentation
/// instead.
///
/// ### Use a window as the main scene
///
/// You can use a window as the main scene of your app when multi-window
/// functionality isn't appropriate. For example, it might not make sense to
/// display more than one window for a video call app that relies on a
/// hardware resource, like a camera:
///
///     @main
///     struct VideoCall: App {
///         var body: some Scene {
///             Window("VideoCall", id: "main") {
///                 CameraView()
///             }
///         }
///     }
///
/// If your app uses a single window as its primary scene, the app quits when
/// the window closes. This behavior differs from an app that uses
/// a ``WindowGroup`` as its primary scene, where the app continues to run
/// even after closing all of its windows.
///
/// > Note: In most cases it's best to use a ``WindowGroup`` to represent the
/// main scene of your app. A window group provides multi-window functionality
/// on platforms that support it, like iPadOS and Windows, and makes it easier
/// to share code across platforms.
public struct Window<Content> : Scene where Content : View {

    // MARK: - Checking characteristics.

    /// The content of the window.
    package let content: () -> Content

    /// The title of the window.
    package let title: Text

    /// The identifier of the window.
    package let id: String

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
        fatalError("not implemented yet")
    }

    // MARK: - Creating a window.

    /// Creates a window with a title and an identifier.
    ///
    /// The window displays the view that you specify.
    ///
    /// > Important: The system ignores any text styling that you apply to
    ///   the ``Text`` view title, like bold or italics. However, you can use
    ///   the formatting controls that the view offers, like for localization,
    ///   dates, and numerical representations.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use for the window's title in system
    ///     menus and in the window's title bar. Provide a title that
    ///     describes the purpose of the window.
    ///   - id: A unique string identifier that you can use to
    ///     open the window.
    ///   - content: The view content to display in the window.
    public init(_ title: Text, id: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.id = id
        self.content = content
    }

    /// Creates a window with a localized title and an identifier.
    ///
    /// The window displays the view that you specify.
    ///
    /// - Parameters:
    ///   - titleKey: A localized string key to use for the window's title in
    ///     system menus and in the window's title bar. Provide a title that
    ///     describes the purpose of the window.
    ///   - id: A unique string identifier that you can use to
    ///     open the window.
    ///   - content: The view content to display in the window.
    public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = Text(titleKey)
        self.id = id
        self.content = content
    }

    /// Creates a window with a title string and an identifier.
    ///
    /// The window displays the view that you specify.
    ///
    /// - Parameters:
    ///   - title: A string to use for the window's title in
    ///     system menus and in the window's title bar. Provide a title that
    ///     describes the purpose of the window.
    ///   - id: A unique string identifier that you can use to
    ///     open the window.
    ///   - content: The view content to display in the window.
    public init(_ title: String, id: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = Text(title)
        self.id = id
        self.content = content
    }

    // MARK: - Creating a window's representation in the OpenSwiftUI scene graph.

    /// Creates a window's representation in the OpenSwiftUI scene graph.
    /// 
    /// - Parameters:
    ///   - scene: The window to create. 
    ///   - inputs: The inputs for the scene.
    /// - Returns: The outputs for the scene.
    public static func _makeScene(scene: _GraphValue<Window<Content>>, inputs: _SceneInputs) -> _SceneOutputs {
        var outputs = inputs
        outputs.type = "\(Self.self)"
        outputs.scene = scene.value
        outputs.id = scene.value.id
        outputs.environmentValues = inputs.environmentValues
        outputs.title = ""

        return outputs
    }
}