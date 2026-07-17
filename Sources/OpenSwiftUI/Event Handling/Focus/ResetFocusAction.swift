//
// ResetFocusAction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 22, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

public struct ResetFocusAction {

    // MARK: - Property(ies).

    @usableFromInline
    var onReset: (() -> Void)?

    // MARK: - Constructor(s).

    @usableFromInline
    init(onReset: (() -> Void)? = nil) {
        self.onReset = onReset
    }

    // MARK: - Function(s).

    /// Asks the focus sytem to reevaluate the default focus item.
    ///
    /// The focus system reevaluates default focus when the currently-focused
    /// item is within the provided namespace.
    ///
    /// - Parameter namespace: The namespace inside which OpenSwiftUI should
    ///   reevaluate default focus. The namespace should match the
    ///   ``View/focusScope(_:)`` block where focus requires reevaluation.
    public func callAsFunction(in namespace: Namespace.ID) {
        fatalError()
    }
}

extension ResetFocusAction : Equatable {
    public static func == (_ lhs: ResetFocusAction, _ rhs: ResetFocusAction) -> Bool {
        ObjectIdentifier(type(of: lhs.self)) == ObjectIdentifier(type(of: rhs.self))
    }
}
