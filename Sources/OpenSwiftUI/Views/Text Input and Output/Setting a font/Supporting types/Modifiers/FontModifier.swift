//
// FontModifier.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

protocol FontModifier {
    func resolve(_ context: Font.Context) -> Font.Resolved
}
