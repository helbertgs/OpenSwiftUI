//
// CommandsBuilder.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// Constructs command sets from multi-expression closures. Like `ViewBuilder`,
/// it supports up to ten expressions in the closure body.
@resultBuilder public struct CommandsBuilder {

    /// Builds an empty command set from a block containing no statements.
    public static func buildBlock() -> EmptyCommands {
        .init()
    }

    /// Passes a single command group written as a child group through
    /// modified.
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Commands {
        content
    }
}
