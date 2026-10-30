//
// CoordinateSpace+ID.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 28, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension CoordinateSpace {
    enum Name : Equatable, Hashable {
        case id(CoordinateSpace.ID)
        case name(AnyHashable)
    }
}