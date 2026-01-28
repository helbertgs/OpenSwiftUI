//
// Font+TextStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Font {

    /// A dynamic text style to use for fonts.
    public enum TextStyle : String, Codable, Equatable, Hashable, CaseIterable, Sendable {

        /// The font style for large titles.
        case largeTitle

        /// The font used for first level hierarchical headings.
        case title

        /// The font used for second level hierarchical headings.
        case title2

        /// The font used for third level hierarchical headings.
        case title3

        /// The font used for headings.
        case headline

        /// The font used for subheadings.
        case subheadline

        /// The font used for body text.
        case body

        /// The font used for callouts.
        case callout

        /// The font used in footnotes.
        case footnote

        /// The font used for standard captions.
        case caption

        /// The font used for alternate captions.
        case caption2
    }
}