//
// VerticalAlignment.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// An alignment position along the horizontal axis.
public struct VerticalAlignment : Equatable, Hashable, Sendable {

    // MARK: - Private Property(ies).

    let key: AlignmentKey

    // MARK: - Static Property(ies).

    /// A guide marking the bottom edge of the view.
    public static let bottom: VerticalAlignment = .init(key: .init(bits: 5))

    /// A guide marking the vertical center of the view.
    public static let center: VerticalAlignment = .init(key: .init(bits: 7))

    /// A guide marking the top edge of the view.
    public static let top: VerticalAlignment = .init(key: .init(bits: 9))

    /// A guide marking the topmost text baseline view.
    public static let firstTextBaseline: VerticalAlignment = .init(key: .init(bits: 11))

    /// A guide marking the bottom-most text baseline in a view.
    public static let lastTextBaseline: VerticalAlignment = .init(key: .init(bits: 13))

    // MARK: - Constructor(s).

    /// Creates an instance with the given identifier.
    ///
    /// Each instance needs a unique identifier.
    ///
    /// - Parameter id: An identifier that uniquely identifies the vertical
    ///   alignment.
    public init(_ id: AlignmentID.Type) {
        self.key = .init(bits: ObjectIdentifier(id).hashValue)
    }

    internal init(key: AlignmentKey) {
        self.key = key
    }
}
