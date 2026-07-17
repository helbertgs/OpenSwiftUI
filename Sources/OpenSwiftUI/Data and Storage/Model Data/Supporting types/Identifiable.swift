//
// Identifiable.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public protocol Identifiable {
    associatedtype ID

    var id: Self.ID { get set }
}