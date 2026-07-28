//
// HorizontalAlignment.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on May 10, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// An alignment position along the horizontal axis.
public struct HorizontalAlignment : Equatable, Hashable, Sendable {

    // MARK: - Private Property(ies).

    let key: AlignmentKey

    // MARK: - Static Property(ies).

    /// A guide marking the leading edge of the view.
    public static let leading: HorizontalAlignment = .init(key: .init(bits: 4))

    /// A guide marking the horizontal center of the view.
    public static let center: HorizontalAlignment = .init(key: .init(bits: 2))

    /// A guide marking the trailing edge of the view.
    public static let trailing: HorizontalAlignment = .init(key: .init(bits: 6))

    // MARK: - Constructor(s).

    /// Creates an instance with the given identifier.
    ///
    /// Each instance needs a unique identifier.
    ///
    /// - Parameter id: An identifier that uniquely identifies the horizontal
    ///   alignment.
    public init(_ id: AlignmentID.Type) {
        self.key = .init(bits: ObjectIdentifier(id).hashValue)
    }

    init(key: AlignmentKey) {
        self.key = key
    }
}
