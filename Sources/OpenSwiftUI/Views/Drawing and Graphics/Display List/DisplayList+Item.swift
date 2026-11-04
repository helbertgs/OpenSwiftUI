//
// DisplayList+Item.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation
import OpenSpatial

extension DisplayList {
    struct Item  {
        var features: [DisplayList.Feature] = []
        let frame: Rect3D
        let value: Value
        let version: DisplayList.Version
        let identity: _DisplayList_Identity

        init(_ value: DisplayList.Item.Value, frame: Rect3D, identity: _DisplayList_Identity, version: DisplayList.Version) {
            self.value = value
            self.frame = frame
            self.identity = identity
            self.version = version
        }

        func canonicalize(options: [DisplayList.Option]) { }
        func matchesTopLevelStructure(of: DisplayList.Item) -> Bool {
            false
        }
    }
}

extension DisplayList.Item : Sendable {
    enum Value : @unchecked Sendable {
        case empty
        case effect(DisplayList.Effect, DisplayList)
        case states([(AnyHashable, DisplayList)])
        case content(DisplayList.Content)

    }
}


struct _DisplayList_Identity {
}
