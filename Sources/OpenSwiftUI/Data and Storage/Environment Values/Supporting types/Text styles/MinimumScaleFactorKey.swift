//
// MinimumScaleFactorKey.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 30, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

@frozen public struct MinimumScaleFactorKey : EnvironmentKey {
    public static var defaultValue: Double {
        1
    }
}

extension EnvironmentValues {

    /// The minimum permissible proportion to shrink the font size to fit the text into the available space.
    ///
    /// In the example below, a label with a ``minimumScaleFactor`` of 0.5 draws its text in a font size as small as half of the actual font if needed to fit into the space next to the text input field:
    ///         HStack {
    ///             Text("This is a very long label:")
    ///                 .lineLimit(1)
    ///                 .minimumScaleFactor(0.5)
    ///             TextField("My Long Text Field", text: $myTextField)
    ///                 .frame(width: 250, height: 50, alignment: .center)
    ///         }    
    /// You can set the minimum scale factor to any value greater than 0 and less than or equal to 1. 
    /// The default value is 1.
    /// 
    /// OpenSwiftUI uses this value to shrink text that doesn’t fit in a view when it’s okay to shrink the text. 
    /// For example, a label with a ``minimumScaleFactor`` of 0.5 draws its text in a font size as small as half the actual font if needed.
    public var minimumScaleFactor: Double {
        get { self[MinimumScaleFactorKey.self] }
        set { self[MinimumScaleFactorKey.self] = newValue }
    }
}
