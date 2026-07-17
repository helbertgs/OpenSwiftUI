//
// RelationshipModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 21, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public struct RelationshipModifier<Value> {

}

struct AccessibilityRelationshipModifier {
    let relationship: AccessibilityRelationshipScope

    init(relationship: AccessibilityRelationshipScope) {
        self.relationship = relationship
    }
}

struct AccessibilityRelationshipScope {
    enum Relationship {
        case labeledPair
    }
}