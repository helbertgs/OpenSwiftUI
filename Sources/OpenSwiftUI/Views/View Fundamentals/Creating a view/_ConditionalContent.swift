//
// _ConditionalContent.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 26, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A view that conditionally contains either a true or false content view.
@frozen public struct _ConditionalContent<TrueContent, FalseContent> : Sendable where TrueContent : Sendable, FalseContent : Sendable {

    /// The storage of the conditional content.
    public let storage: Storage
    
    /// Creates a new conditional content with the given storage.
    /// 
    /// - Parameter storage: The storage of the conditional content.
    public init(storage: Storage) {
        self.storage = storage
    }

    /// The storage of the conditional content.
    @frozen public enum Storage : Sendable {

        /// The true content of the conditional content.
        case trueContent(TrueContent)

        /// The false content of the conditional content.
        case falseContent(FalseContent)
    }
}

extension _ConditionalContent : View where TrueContent: View, FalseContent: View {

    /// The body of the conditional content.
    public var body: Never { 
        fatalError("not implemented yet") 
    }

    /// Creates a new conditional content with the given storage.
    /// 
    /// - Parameter view: The view to create the conditional content from.
    /// - Parameter inputs: The inputs for the conditional content.
    /// - Returns: The outputs for the conditional content.
    public static func _makeView(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewInputs) -> _ViewOutputs {
        .init()
        // return switch view.value.storage {
        //     case .falseContent(let view):
        //         FalseContent.Body._makeView(view: .init(view.body), inputs: inputs)
        //     case .trueContent(let view):
        //         TrueContent.Body._makeView(view: .init(view.body), inputs: inputs)
        // }
    }
}