//
// ShaderLibrary.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@dynamicMemberLookup
public struct ShaderLibrary : Equatable, Hashable, Sendable, SendableMetatype {
    
    let data: Data
    
    /// Creates a new OpenGL shader library from the contents of `url`,
    /// which must be the location  of precompiled Metal library.
    /// Functions compiled from the returned library will only be
    /// cached as long as the returned library exists.
    public init(url: URL) {
        if let data = try? Data(contentsOf: url) {
            self.data = data
        } else {
            self.data = Data()
        }
    }
    
    /// Creates a new OpenGL shader library from `data`, which must be
    /// the contents of precompiled OpenGL library. Functions compiled
    /// from the returned library will only be cached as long as the
    /// returned library exists.
    public init(data: Data) {
        self.data = data
    }
    
    /// The default shader library of the main (i.e. app) bundle.
    public static var `default`: ShaderLibrary {
        bundle(Bundle(for: ShaderLibraryDefault.self))
    }
    
    @available(*, unavailable)
    public static var system: ShaderLibrary {
        .init(data: .init())
    }
    
    /// Returns the default shader library of the specified bundle.
    public static func bundle(_ bundle: Bundle) -> ShaderLibrary {
        .init(url: bundle.bundleURL)
    }
    
    /// Returns a new shader function representing the GLSL
    /// shader called `name` in the default shader library.
    ///
    /// Typically this subscript is used implicitly via the dynamic
    /// member syntax, for example:
    ///
    ///    let fn = ShaderLibrary.myShader
    ///
    /// which creates a reference to the GLSL shader called
    /// `myShader()`.
    public static subscript(dynamicMember name: String) -> ShaderFunction {
        .init(
            library: .default,
            name: name
        )
    }

    /// Returns a new shader function representing the GLSL
    /// Shader in the library called `name`.
    ///
    /// Typically this subscript is used implicitly via the dynamic
    /// member syntax, for example:
    ///
    ///    let fn = ShaderLibrary.default.myShader
    ///
    /// which creates a reference to the GLSL shader called
    /// `myShader()`.
    public subscript(dynamicMember name: String) -> ShaderFunction {
        .init(
            library: .init(data: data),
            name: name
        )
    }
}

extension ShaderLibrary {
    fileprivate class ShaderLibraryDefault { }
}
