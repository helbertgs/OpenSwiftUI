//
// _ViewListInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 24, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

/// The inputs passed to `_makeViewList`.
///
/// Mirrors `_ViewInputs` but scoped to list-building: a view contributing
/// to a container only needs the parent frame and the active graph context.
/// In the real AttributeGraph this also carries list-identity information
/// used by `ForEach` diffing; here it is a thin wrapper kept separate from
/// `_ViewInputs` for API fidelity.
public struct _ViewListInputs {

    /// The frame proposed by the parent container.
    var frame: _GraphValue<Rect3D>

    /// The environment propagated from the parent.
    var environment: _GraphValue<EnvironmentValues>

    /// The active transaction.
    var transaction: _GraphValue<Transaction>
    
    /// The gesture handler for registering taps and hover interactions.
    var gestureHandler: GestureHandler?

    /// Creates list inputs from full view inputs, preserving the gesture handler.
    public init(from inputs: _ViewInputs) {
        self.frame          = inputs.frame
        self.environment    = inputs.environment
        self.transaction    = inputs.transaction
        self.gestureHandler = inputs.gestureHandler
    }
}