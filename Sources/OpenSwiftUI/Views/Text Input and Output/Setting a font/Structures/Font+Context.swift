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

extension Font {

    /// Information used to resolve a font.
    public struct Context {

        init() { }

        mutating func resolve(_ font: Font) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Font.AnyFontBox) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Font.NamedProvider) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Font.SystemProvider) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Any) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Font.StaticModifierProvider<ItalicModifier>) -> Font.Resolved {
            fatalError("not implemented yet")
        }

        mutating func resolve(_ provider: Font.StaticModifierProvider<BoldModifier>) -> Font.Resolved {
            fatalError("not implemented yet")
        }
    }
}