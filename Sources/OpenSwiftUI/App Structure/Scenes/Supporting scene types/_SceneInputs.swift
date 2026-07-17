//
// _SceneInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenSpatial

public struct _SceneInputs {

    /// Base outputs snapshot used when applying a modifier over an existing scene output.
    var baseOutputs: _SceneOutputs? = nil

    /// The environment values available before scene modifiers are applied.
    var environmentValues: EnvironmentValues = .init()

    public init() {}

    public init(outputs: _SceneOutputs) {
        baseOutputs = outputs
        environmentValues = outputs.environmentValues
    }
}
