//
// Responder.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 18, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An abstract class that forms the basis of event and command processing in OpenSwiftUI
class Responder : NSObject {
    
    // MARK: - Creating a Responder Object

    /// Initializes and returns a newly allocated responder object.
    override init() {
        super.init()
    }

    // MARK: - Changing the First Responder

    /// A Boolean value that indicates whether the responder accepts first responder status.
    /// 
    /// As first responder, the receiver is the first object in the responder chain to be sent key events and action messages. 
    /// Subclasses set this property to true if the receiver accepts first responder status.
    /// 
    /// By default, this property is false. 
    var acceptsFirstResponder: Bool = false

    /// Notifies the receiver that it’s about to become first responder in its HostingWindow.
    /// 
    /// The default implementation returns true, accepting first responder status. 
    /// Subclasses can override this method to update state or perform some action such as highlighting the selection, or to return false, refusing first responder status.
    /// 
    /// Use the HostingWindow `makeFirstResponder(_:)` method, not this method, to make an object the first responder. 
    /// Never invoke this method directly.
    func becomeFirstResponder() -> Bool {
        true
    }

    /// Notifies the receiver that it’s been asked to relinquish its status as first responder in its window.
    /// 
    /// The default implementation returns true, resigning first responder status. 
    /// Subclasses can override this method to update state or perform some action such as unhighlighting the selection, or to return false, refusing to relinquish first responder status.
    /// 
    /// Use the HostingWindow `makeFirstResponder(_:)` method, not this method, to make an object the first responder. Never invoke this method directly.
    func resignFirstResponder() -> Bool {
        true
    }

    // MARK: - Managing the Next Responder

    /// The next responder after this one, or nil if it has none.
    /// 
    /// The next responder must be an object that inherits, directly or indirectly, from `Responder`.
    var nextResponder: Responder?

    // MARK: - Responding to Mouse Events
}