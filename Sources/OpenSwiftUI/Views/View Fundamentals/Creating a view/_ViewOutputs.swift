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

    /// The list of view elements produced by this view.
    var viewList: _ViewList

    /// The optional preference store attribute produced by preference modifiers.
    var preferenceStore: Attribute<PreferenceStore>?

    /// The optional background color attribute.
    var background: Attribute<Color>?

    /// The optional canvas render descriptor attribute.
    var canvasDescriptor: Attribute<CanvasRenderDescriptor>?

    /// The intrinsic frame computed by a leaf view (e.g. `Text.sizeThatFits`).
    ///
    /// When present, `ModifiedContent` replaces `inputs.frame` with this value
    /// before calling the modifier, so `onHover`/`onTapGesture`/`focused`
    /// hit-test against the view's real area rather than the space proposed by the parent.
    var resolvedFrame: Attribute<Rect3D>?

    /// Creates view outputs.
    /// - Parameters:
    ///   - viewList: The view element list. Defaults to an empty list.
    ///   - background: The optional background color attribute. Defaults to `nil`.
    init(viewList: _ViewList = _ViewList(), background: Attribute<Color>? = nil) {
        self.viewList         = viewList
        self.background       = background
        self.canvasDescriptor = nil
        self.preferenceStore  = nil
        self.resolvedFrame    = nil
    }
}