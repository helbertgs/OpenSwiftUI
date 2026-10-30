//
// _ViewDebug.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation

@MainActor
struct _ViewDebug {
    static var properties: [_ViewDebug.Property] = []
}

extension _ViewDebug {
    enum Property : CaseIterable, Equatable, Hashable, Sendable {
        case displayList
        case environment
        case layoutComputer
        case size
        case type
        case phase
        case value
        case position
        case transform
    }
}

extension _ViewDebug {
    struct Data {
        let childData: [_ViewDebug.Data]
        let data: [_ViewDebug.Property : Any]
    }
}