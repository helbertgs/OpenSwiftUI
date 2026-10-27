//
// ShaderFunction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A reference to a function in a Metal shader library.
public struct ShaderFunction : Equatable, Hashable, Sendable, SendableMetatype {
    
    /// The shader library storing the function.
    public let library: ShaderLibrary

    /// The name of the shader function in the library.
    public let name: String
    
    /// Creates a new function reference from the provided shader library and function name string.
    ///
    /// - Parameters:
    ///   - library: The shader library storing the function.
    ///   - name: The name of the shader function in the library.
    public init(library: ShaderLibrary, name: String) {
        self.library = library
        self.name = name
    }
    
    /// Returns a new shader by applying the provided argument values
    /// to the referenced function.
    ///
    /// Typically this subscript is used implicitly via function-call
    /// syntax, for example:
    ///
    ///     let shader = ShaderLibrary.default.myFunction(.float(42))
    ///
    /// which creates a shader passing the value `42` to the first
    /// unbound parameter of `myFunction()`.
    public func dynamicallyCall(withArguments arguments: [Shader.Argument]) -> Shader {
        .init(
            function: .init(
                library: library,
                name: name),
            arguments: arguments
        )
    }
}
