//
// SymbolColorRenderingMode.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

/// A method of filling a layer in a symbol image.
public struct SymbolColorRenderingMode : Codable, Equatable, Hashable, Sendable {

    // MARK: - Checking Characteristics.

    /// The storage for the symbol color rendering mode.
    let storage: Storage

    // MARK: - Creating a Symbol Color Rendering Mode.

    /// Creates a symbol color rendering mode with the given storage.
    /// 
    /// - Parameter storage: The storage for the symbol color rendering mode.
    init(storage: Storage) {
        self.storage = storage
    }

    /// The symbol image layer should be filled with a solid color.
    public static let flat = SymbolColorRenderingMode(storage: .flat)

    /// The symbol image layer should be filled with an axial gradient.
    public static let gradient = SymbolColorRenderingMode(storage: .gradient)
}

extension SymbolColorRenderingMode {

    /// The storage for the symbol color rendering mode.
    enum Storage : String, Codable, Equatable, Hashable, Sendable {

        /// The symbol image layer should be filled with a solid color.
        case flat

        /// The symbol image layer should be filled with an axial gradient.
        case gradient
    }
}