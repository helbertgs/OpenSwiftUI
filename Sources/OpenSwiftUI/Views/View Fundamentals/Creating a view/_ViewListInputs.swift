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

    var base: _GraphInputs


    init(base: _GraphInputs) {
        self.base = base
    }
}
