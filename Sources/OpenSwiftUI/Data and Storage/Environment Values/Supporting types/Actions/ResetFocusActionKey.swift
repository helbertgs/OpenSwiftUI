//
// ResetFocusActionKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 15, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct ResetFocusActionKey : EnvironmentKey {
    public static var defaultValue: ResetFocusAction { 
        .init()
     }
}

extension EnvironmentValues {

    /// An action that requests the focus system to reevaluate default focus.
    ///
    /// Get this environment value and call and call it as a function to force
    /// a default focus reevaluation at runtime.
    ///
    ///     @Namespace var mainNamespace
    ///     @Environment(\.resetFocus) var resetFocus
    ///
    ///     var body: some View {
    ///         // ...
    ///         resetFocus(in: mainNamespace)
    ///         // ...
    ///     }
    ///
    public var resetFocus: ResetFocusAction {
        get { self[ResetFocusActionKey.self] }
        set { self[ResetFocusActionKey.self] = newValue }
    }
}
