//
// EnvironmentalModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 22, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// A modifier that must resolve to a concrete modifier in an environment before
/// use.
public protocol EnvironmentalModifier : ViewModifier where Self.Body == Never {

    // MARK: - Associated Type(s).

    /// The type of modifier to use after being resolved.
    associatedtype ResolvedModifier : ViewModifier

    // MARK: - Property(ies).

    static var _requiresMainThread: Bool { get }

    // MARK: - Function(s).

    /// Resolve to a concrete modifier in the given `environment`.
    func resolve(in environment: EnvironmentValues) -> Self.ResolvedModifier
}
