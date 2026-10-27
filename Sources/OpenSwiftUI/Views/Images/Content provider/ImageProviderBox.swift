//
// ImageProviderBox.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation 

extension Image {

    /// A base provider for all image providers.
    @usableFromInline    
    class AnyImageProviderBox : Equatable, Hashable, @unchecked Sendable {
        init() { }
        
        func `as`<T>(_ t: T.Type) -> T? {
            nil
        }
        
        @usableFromInline
        static func == (_ lhs: AnyImageProviderBox, _ rhs: AnyImageProviderBox) -> Bool {
            guard ObjectIdentifier(lhs) == ObjectIdentifier(rhs) else {
                return false
            }
            
            return true
        }
        @usableFromInline
        func hash(into hasher: inout Hasher) {
        }
    }

    /// A provider that wraps a specific image provider.
    @usableFromInline
    class ImageProviderBox<Provider> : AnyImageProviderBox, @unchecked Sendable {

        /// The wrapped provider.
        var provider: Provider

        /// Initializes a new image provider box.
        /// 
        /// - Parameters:
        ///   - provider: The wrapped provider.
        init(provider: Provider) {
            self.provider = provider
        }
    }
}
