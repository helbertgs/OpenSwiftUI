//
// Transaction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 01, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen public struct Transaction {
    
    // MARK: - Property(ies).
    
    @usableFromInline var animation: Animation?
    @usableFromInline var disableAnimations: Bool
    
    // MARK: - Constructor(s).
    
    @inlinable public init(animation: Animation? = nil, disableAnimations: Bool = false) {
        self.animation = animation
        self.disableAnimations = disableAnimations
    }
}

