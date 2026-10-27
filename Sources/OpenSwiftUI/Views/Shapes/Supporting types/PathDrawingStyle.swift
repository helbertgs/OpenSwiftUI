//
// PathDrawingStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

enum PathDrawingStyle : Equatable, Hashable, Sendable, SendableMetatype {
    case fill(FillStyle)
    case stroke(StrokeStyle)
}
