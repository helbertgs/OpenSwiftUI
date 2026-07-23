//
// OpenWindowAction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Swift

@frozen public struct OpenWindowActionKey : EnvironmentKey {
    public static var defaultValue: OpenWindowAction {
        .init(action: { _ in }) 
    }
}

extension EnvironmentValues {

    /// An action that presents a window.
    ///
    /// If the targeted scene accepts data, then the value passed to the action
    /// will be provided to the scene's content closure.
    ///
    /// Use the ``EnvironmentValues/openWindow`` environment value to get the
    /// instance of this structure for a given ``Environment``. Then call the
    /// instance to present a window. You call the instance directly because it
    /// defines a ``OpenWindowAction/callAsFunction(id:)`` method that Swift
    /// calls when you call the instance.
    ///
    /// For example, you can define a button that opens the specified note
    /// value in a new window.
    ///
    ///     @main
    ///     struct Notes: App {
    ///         var body: some Scene {
    ///             WindowGroup(for: Note.ID.self) { $noteID in
    ///                 // ...
    ///             }
    ///         }
    ///     }
    ///
    ///     struct NewNoteWindow: View {
    ///         var note: Note
    ///         @Environment(\.openWindow) private var openWindow
    ///
    ///         var body: some View {
    ///             Button("Open Note In New Window") {
    ///                 openWindow(value: note.id)
    ///             }
    ///         }
    ///     }
    ///
    public internal(set) var openWindow: OpenWindowAction {
        get { self[OpenWindowActionKey.self] }
        set { self[OpenWindowActionKey.self] = newValue }
    }
}