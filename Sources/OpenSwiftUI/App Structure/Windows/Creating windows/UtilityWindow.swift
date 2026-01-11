//
// UtilityWindow.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A specialized window scene that provides secondary utility to the content
/// of the main scenes of an application.
///
/// Utility windows are typically used to display controls, settings, or
/// information associated the main content of an application, sometimes
/// referred to as tool palettes or inspector windows. Because of this
/// role, they have specialized behavior compared to all other windows:
/// - They receive `FocusedValues` from the focused main scene in an application,
///   similar to commands in the main menu, which can be used to display
///   information on the active content as the user focuses on different scenes.
/// - They have a default window level of `.floating` so they remain visible
///   when moving focus between the main scenes.
/// - They hide when the window is no longer active.
/// - They only become focused when explicitly needed, such as clicking
///   in the titlebar or on a focusable view.
/// - When focused, they can be dismissed with the Escape key.
/// - They are not minimizable by default.
///
///     @main
///     struct PhotoBrowser: App {
///         var body: some Scene {
///             WindowGroup {
///                 PhotoGallery()
///             }
///
///             UtilityWindow("Photo Info", id: "photo-info") {
///                 PhotoInfoViewer()
///             }
///         }
///     }
///
///     struct PhotoInfoViewer: View {
///         // Automatically updates to the photo selection from whichever
///         // photo gallery window is focused.
///         @FocusedValue(PhotoSelection.self) private var selectedPhotos
///
///         var body: some View {
///             Text("\(selectedPhotos.count) photos selected")
///         }
///     }
///
/// `UtilityWindow` will automatically add a menu item to show/hide itself in
/// the "View" menu. This can be removed by applying ``Scene/commandsRemoved()``
/// to the utility window, and manually placing a ``WindowVisibilityToggle``
/// elsewhere in an app's commands. Utility windows can also be programmatically
/// presented with ``EnvironmentValues/openWindow`` and dismissed using
/// ``EnvironmentValues/dismiss``.
public struct UtilityWindow<Content> : Scene where Content : View {

    // MARK: - Checking characteristics.

    /// The content of the utility window.
    package let content: Content

    /// The title of the utility window.
    package let title: Text

    /// The identifier of the utility window.
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

    /// Creates a utility window with a title and identifier.
    ///
    /// > Important: The system ignores any text styling that you apply to
    ///   the ``Text`` view title, like bold or italics. However, you can use
    ///   the formatting controls that the view offers, like for localization,
    ///   dates, and numerical representations.
    ///
    /// - Parameters:
    ///   - title: The ``Text`` view to use in the utility window's title bar.
    ///     Provide a title that describes the purpose of the utility window.
    ///   - id: An unique string identifier that you can use to open the utility
    ///     window.
    ///   - content: The view content to display in the utility window.
    public init(_ title: Text, id: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.id = id
        self.content = content()
    }

    /// Creates a utility window with a localized title and identifier.
    ///
    /// - Parameters:
    ///   - titleKey: A localized string key to use in the utility window's
    ///     title bar. Provide a title that describes the purpose of the utility
    ///     window.
    ///   - id: An unique string identifier that you can use to open the utility
    ///     window.
    ///   - content: The view content to display in the utility window.
    public init(_ titleKey: LocalizedStringKey, id: String, @ViewBuilder content: () -> Content) {
        self.title = Text(titleKey)
        self.id = id
        self.content = content()
    }

    /// Creates a utility window with a title string and identifier.
    ///
    /// - Parameters:
    ///   - title: A string to use in the utility window's title bar. Provide a
    ///     title that describes the purpose of the utility window.
    ///   - id: An unique string identifier that you can use to open the utility
    ///     window.
    ///   - content: The view content to display in the utility window.
    public init<S>(_ title: S, id: String, @ViewBuilder content: () -> Content) where S : StringProtocol {
        fatalError("not implemented yet")
    }

    // MARK: - Creating a utility window's representation in the OpenSwiftUI scene graph.

    /// Creates a utility window's representation in the OpenSwiftUI scene graph.
    ///
    /// - Parameters:
    ///   - scene: The utility window to create.
    ///   - inputs: The inputs for the utility window.
    /// - Returns: The outputs for the utility window.
    public static func _makeScene(scene: _GraphValue<UtilityWindow<Content>>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError("not implemented yet")
    }
}