//
// EmptyCommands.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct EmptyCommands : Commands {

    // MARK: - Type Alias.

    /// The type of commands that represents the body of this command hierarchy.
    ///
    /// When you create custom commands, Swift infers this type from your
    /// implementation of the required ``OpenSwiftUI/Commands/body-swift.property``
    /// property.
    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Constructor(s).

    /// Creates an empty command hierarchy.
    @inlinable public init() { }
}
