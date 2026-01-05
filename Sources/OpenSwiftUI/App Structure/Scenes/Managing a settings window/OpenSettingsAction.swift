//
// OpenSettingsAction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 5, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An action that presents the settings scene for an app.
///
/// Use the ``EnvironmentValues/openSettings`` environment value to get the
/// instance of this structure for a given ``Environment``. Then call the
/// instance to open a window. You call the instance directly because it
/// defines a ``OpenSettingsAction/callAsFunction()`` method that Swift calls
/// when you call the instance.
///
/// For example, you can define a button that opens the settings window to
/// a particular tab:
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
///     struct SettingsView: View {
///         @AppStorage("selectedSettingsTab")
///         private var selectedSettingsTab = SettingsTab.general
///
///         var body: some View {
///             TabView(selection: $selectedSettingsTab) {
///                 GeneralSettings()
///                 AdvancedSettings()
///             }
///         }
///     }
///
///     struct AdvancedSettingsButton: View {
///         @AppStorage("selectedSettingsTab")
///         private var selectedSettingsTab = SettingsTab.general
///
///         @Environment(\.openSettings) private var openSettings
///
///         var body: some View {
///             Button("Open Advanced Settings…") {
///                 selectedSettingsTab = .advanced
///                 openSettings()
///             }
///         }
///     }
///
///     enum SettingsTab: Int {
///         case general
///         case advanced
///     }
/// 
@MainActor @preconcurrency public struct OpenSettingsAction : Equatable, Sendable {

    /// Opens the window associated to the ``Settings`` scene defined by this
    /// app, if one exists.
    ///
    /// Calling this action when the window is already open will order it to
    /// the front.
    ///
    /// Don't call this method directly. OpenSwiftUI calls it when you
    /// call the ``EnvironmentValues/openSettings`` action:
    ///
    ///     openSettings()
    ///
    /// For information about how Swift uses the `callAsFunction()` method to
    /// simplify call site syntax, see
    /// [Methods with Special Names](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID622)
    /// in *The Swift Programming Language*.
    @MainActor @preconcurrency public func callAsFunction() {
        fatalError("not implemented yet")
    }
}

struct OpenSettingsActionKey : EnvironmentKey {
    static var defaultValue: OpenSettingsAction {
        OpenSettingsAction()
    }
}

extension EnvironmentValues {

    /// A Settings presentation action stored in a view's environment.
    ///
    /// Use the `openSettings` environment value to get an
    /// ``OpenSettingsAction`` instance for a given ``Environment``. Then call
    /// the instance to open a window. You call the instance directly because it
    /// defines a ``OpenSettingsAction/callAsFunction()`` method that Swift
    /// calls when you call the instance.
    ///
    /// For example, you can define a button that opens the settings window to
    /// a particular tab:
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
    ///     struct SettingsView: View {
    ///         @AppStorage("selectedSettingsTab")
    ///         private var selectedSettingsTab = SettingsTab.general
    ///
    ///         var body: some View {
    ///             TabView(selection: $selectedSettingsTab) {
    ///                 GeneralSettings()
    ///                 AdvancedSettings()
    ///             }
    ///         }
    ///     }
    ///
    ///     struct AdvancedSettingsButton: View {
    ///         @AppStorage("selectedSettingsTab")
    ///         private var selectedSettingsTab = SettingsTab.general
    ///
    ///         @Environment(\.openSettings) private var openSettings
    ///
    ///         var body: some View {
    ///             Button("Open Advanced Settings…") {
    ///                 selectedSettingsTab = .advanced
    ///                 openSettings()
    ///             }
    ///         }
    ///     }
    ///
    ///     enum SettingsTab: Int {
    ///         case general
    ///         case advanced
    ///     }
    public var openSettings: OpenSettingsAction {
        get { self[OpenSettingsActionKey.self] }
        set { self[OpenSettingsActionKey.self] = newValue }
    }
}