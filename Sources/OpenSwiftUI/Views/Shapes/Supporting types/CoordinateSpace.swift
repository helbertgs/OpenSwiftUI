//
// _ResolvedAppearance.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

enum CoordinateSpace: Equatable, Hashable {
    case local
    case named(AnyHashable)
    case global
    case id(CoordinateSpace.ID)
}