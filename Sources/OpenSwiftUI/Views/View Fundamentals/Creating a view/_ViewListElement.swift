//
// _ViewListElement.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

/// A single element in a `_ViewList`.
struct _ViewListElement {

    /// The stable identity of this element.
    var id: _ViewIdentity

    /// The attribute producing this element's display list.
    var displayList: Attribute<DisplayList>

    /// A human-readable name for debugging.
    var name: String
}