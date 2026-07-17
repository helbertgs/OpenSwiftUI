//
// _AppearanceActionModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 20, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

@frozen
public struct _AppearanceActionModifier : ViewModifier {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).
    
    public let appear: (() -> Void)?
    public let disappear: (() -> Void)?
    
    // MARK: - Constructor(s).
    
    @inlinable
    public init(appear: (() -> Void)? = nil, disappear: (() -> Void)? = nil) {
        self.appear = appear
        self.disappear = disappear
    }
    
    // MARK: - Function(s).
    
    public func body(content: Content) -> Never {
        fatalError()
    }
}
