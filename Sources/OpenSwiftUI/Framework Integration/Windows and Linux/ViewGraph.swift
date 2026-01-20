//
// ViewGraph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation

/// A graph host for a view.
class ViewGraph : GraphHost {

    /// The last built outputs snapshot.
    private(set) var outputs: _ViewOutputs

    /// Whether this view graph needs to be re-built/re-rendered.
    var isDirty: Bool = true

    init(outputs: _ViewOutputs) {
        self.outputs = outputs
    }

    func markDirty() {
        isDirty = true
    }

    func clearDirty() {
        isDirty = false
    }

    func updateOutputs(_ newOutputs: _ViewOutputs) {
        outputs = newOutputs
        markDirty()
    }
}