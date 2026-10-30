//
// _ViewOutputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 26, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// The result returned by `_makeView`: a list of view elements plus optional preferences.
///
/// `background` and `canvasDescriptor` are propagated via `PreferenceKey`
/// (`_BackgroundPreference`, `_CanvasPreference`) to keep the correct graph
/// direction (child → parent, rather than an extra field on the output).
public struct _ViewOutputs {

    let layoutComputer: Attribute<LayoutComputer>?
    let preferences: PreferencesOutputs

    init(layoutComputer: Attribute<LayoutComputer>?, preferences: PreferencesOutputs) {
        self.layoutComputer = layoutComputer
        self.preferences = preferences
    }
}