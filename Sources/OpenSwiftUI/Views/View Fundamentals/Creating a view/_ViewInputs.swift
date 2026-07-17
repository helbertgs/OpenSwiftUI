//
// _ViewInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 26, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct _ViewInputs {

    /// The environment values for the view.
    var environmentValues: EnvironmentValues = .init()

    /// The modifiers applied to the view.
    var modifiers: [any SceneModifier] = []

    /// The content of the scene, if any.
    var content: (any View)? = nil
}
