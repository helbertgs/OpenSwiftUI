//
// Animatable.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A type that describes how to animate a property of a view.
public protocol Animatable {

    // MARK: - Animating data

    /// The type defining the data to animate.
    associatedtype AnimatableData : VectorArithmetic

    /// The data to animate.
    var animatableData: Self.AnimatableData { get set }
}
