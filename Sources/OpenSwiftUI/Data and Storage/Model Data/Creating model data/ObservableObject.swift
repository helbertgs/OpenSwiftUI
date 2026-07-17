//
// ObservableObject.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenCombine

extension ObservableObject {
    
    /// The key path to the observable object store in the environment.
    static var environmentStore: WritableKeyPath<EnvironmentValues, Self> {
        fatalError("Must be implemented by conforming type")
    }
}