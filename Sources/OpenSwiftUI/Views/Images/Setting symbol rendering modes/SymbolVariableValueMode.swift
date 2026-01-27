//
// SymbolVariableValueMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A method of rendering the variable value of a symbol image.
public struct SymbolVariableValueMode : Equatable, Sendable {

    // MARK: - Checking Characteristics.

    /// The storage for the symbol variable value mode.
    let storage: Storage

    // MARK: - Creating a Symbol Variable Value Mode.

    /// Creates a symbol variable value mode with the given storage.
    /// 
    /// - Parameter storage: The storage for the symbol variable value mode.
    init(storage: Storage) {
        self.storage = storage
    }

    // MARK: - Getting symbol variable value modes
    /// The "color" variable value mode. Sets the opacity of
    /// each variable layer to either on or off depending on
    /// how its threshold compared to the current value.
    public static let color = SymbolVariableValueMode(storage: .color)

    /// The "draw" variable value mode. Changes the drawn length
    /// of each variable layer to either based on how its range
    /// relates to the current value.
    public static let draw = SymbolVariableValueMode(storage: .draw)
}

extension SymbolVariableValueMode {

    /// The storage for the symbol variable value mode.
    enum Storage : String, Codable, Equatable, Hashable, Sendable {

        /// The "color" variable value mode.
        case color

        /// The "draw" variable value mode.
        case draw
    }
}