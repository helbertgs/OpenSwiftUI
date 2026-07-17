//
// _ViewOutputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 26, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct _ViewOutputs {

    /// The type of the view.
    var type: Any.Type!

    /// The view that this output represents.
    var view: (any View)? = nil

    /// The environment values for the view.
    var environmentValues: EnvironmentValues = .init()

    /// The modifiers applied to the view.
    var modifiers: [any ViewModifier] = []

    /// The child views of this view output.
    var children: [_ViewOutputs] = []

    /// The content view of the view, if applicable.
    var content: (any View)? = nil
}
