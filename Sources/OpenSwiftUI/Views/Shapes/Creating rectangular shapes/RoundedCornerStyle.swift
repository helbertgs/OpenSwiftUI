//
// RoundedCornerStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 01, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// Defines the shape of a rounded rectangle’s corners.
public enum RoundedCornerStyle : String, Codable, Copyable, Equatable, Hashable, Sendable {

    // MARK: - Getting corner styles

    /// Quarter-circle rounded rect corners.
    case circular
    
    /// Continuous curvature rounded rect corners.
    case continuous
}