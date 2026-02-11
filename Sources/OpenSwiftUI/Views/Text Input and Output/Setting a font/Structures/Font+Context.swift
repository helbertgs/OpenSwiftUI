//
// Font+Context.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenFreeType
import OpenHarfBuzz
import OpenSpatial

extension Font {

    /// Information used to resolve a font.
    public struct Context {

        var resolved: Font.Resolved = .init()
    }
}
