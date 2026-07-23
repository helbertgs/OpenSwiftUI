//
// _ViewList.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An ordered list of view elements produced by `_makeView`.
///
/// A `_ViewList` (rather than a single `Attribute<DisplayList>`) is needed
/// because `TupleView`, `ForEach`, and `Group` produce multiple children;
/// the list aggregates N elements without losing their individual identities.
struct _ViewList {

    /// The ordered view elements.
    var elements: [_ViewListElement] = []

    /// Appends a single element to the list.
    /// - Parameter element: The element to append.
    mutating func append(_ element: _ViewListElement) {
        elements.append(element)
    }

    /// Appends the elements of another list to this one.
    /// - Parameter other: The list whose elements to append.
    mutating func append(contentsOf other: _ViewList) {
        elements.append(contentsOf: other.elements)
    }
}