//
// _ViewInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 26, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// The context passed into each `_makeView`.
///
/// In the real AttributeGraph this carries only layout and environment inputs —
/// never the graph itself. The graph is accessed implicitly via
/// `_GraphContext.current` inside any `rule {}` or `input()` invoked during `_makeView`.
@MainActor
public struct _ViewInputs {
    
    /// The space available for laying out this view.
    var frame: _GraphValue<Rect3D>

    /// The environment propagated down the view tree.
    var environment: _GraphValue<EnvironmentValues>

    /// The active transaction, carrying animation intent.
    var transaction: _GraphValue<Transaction>

    /// The gesture registration point, instantiated by the `ViewGraph`/`ApplicationLoop`
    /// and passed down the tree so views need not know about the `ApplicationLoop`.
    ///
    /// In real SwiftUI this is `_GestureInputs`; here it is simplified to a single handler.
    var gestureHandler: GestureHandler?

    /// Creates view inputs.
    /// - Parameters:
    ///   - frame: The frame attribute available for layout.
    ///   - environment: The environment attribute propagated down the tree.
    ///   - transaction: The transaction attribute carrying animation intent.
    ///   - gestureHandler: The optional gesture handler for registering gestures.
    init(
        frame: Attribute<Rect3D>,
        environment: Attribute<EnvironmentValues>,
        transaction: Attribute<Transaction>,
        gestureHandler: GestureHandler? = nil
    ) {
        self.frame          = _GraphValue(base: frame)
        self.environment    = _GraphValue(base: environment)
        self.transaction    = _GraphValue(base: transaction)
        self.gestureHandler = gestureHandler
    }
}
