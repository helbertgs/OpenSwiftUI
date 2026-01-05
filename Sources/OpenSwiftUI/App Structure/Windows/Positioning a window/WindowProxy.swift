//
// WindowProxy.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 4, 2025.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

/// The proxy for an open window in the app.
@available(Windows 11, *)
public struct WindowProxy : Equatable {

    // MARK: - Instance Property

    /// The ID for the window, if one was provided.
    public let id: String?

    /// The window’s current ``ScenePhase``.
    public let phase: ScenePhase

    // MARK: - Initializer

    /// Creates a window proxy with the given properties.
    /// 
    /// - Parameters:
    ///   - id: The ID for the window, if one was provided.
    ///   - phase: The window's current ``ScenePhase``.
    package init(id: String?, phase: ScenePhase) {
        self.id = id
        self.phase = phase
    }
}