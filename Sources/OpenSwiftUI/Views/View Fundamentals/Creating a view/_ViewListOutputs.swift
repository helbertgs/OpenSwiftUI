//
// _ViewListOutputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 24, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

/// The result returned by `_makeViewList`.
///
/// Carries the same `_ViewList` that `_ViewOutputs` carries, but without
/// modifier-specific fields (background, canvas, resolvedFrame). Containers
/// merge these lists from each child into their own `_ViewOutputs`.
public struct _ViewListOutputs {

    /// The ordered list of view elements contributed by this view.
    var viewList: _ViewList

    init(viewList: _ViewList = _ViewList()) {
        self.viewList = viewList
    }
}