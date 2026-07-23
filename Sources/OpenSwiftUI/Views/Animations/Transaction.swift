//
// Transaction.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 01, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

/// The context of the current state-processing update.
/// 
/// Use a transaction to pass an animation between views in a view hierarchy.
/// The root transaction for a state change comes from the binding that changed, plus any global values set by calling `withTransaction(_:_:)` or `withAnimation(_:_:)`.
public struct Transaction {
    
    // MARK: - Managing animations
    
    var plist: PropertyList
    
    // MARK: - Creating a transaction

    public init() {
        plist = PropertyList()
    }

    init(plist: PropertyList) {
        self.plist = plist
    }

    /// Accesses the value for the given `TransactionKey`.
    public subscript<K: TransactionKey>(key: K.Type) -> K.Value {
        get { plist[key] }
        set { plist[key] = newValue }
    }

    var isEmpty: Bool { plist.isEmpty }
}