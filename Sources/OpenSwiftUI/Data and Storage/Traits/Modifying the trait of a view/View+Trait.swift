//
// View+Trait.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

extension View {
    @inlinable
    public func _trait<K>(_ key: K.Type, _ value: K.Value) -> some View where K : _ViewTraitKey {
        modifier(_TraitWritingModifier<K>(value: value))
    }
}
