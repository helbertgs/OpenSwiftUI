//
// _SceneInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenSpatial

/// The context that the `AppGraph` supplies to each `Scene` before calling `_makeScene`.
///
/// This is the scene-level equivalent of `_ViewInputs`, carrying the app's
/// environment (inherited by the scene's `ViewGraph`) and the initial
/// `ScenePhase` propagated by the `AppGraph`.
public struct _SceneInputs {

    /// The environment inherited by the scene's view graph.
    public var environment: EnvironmentValues

    /// The initial scene phase propagated by the app graph.
    public var phase: ScenePhase

    /// Creates scene inputs.
    /// 
    /// - Parameters:
    ///   - environment: The environment to inherit. Defaults to an empty environment.
    ///   - phase: The initial scene phase. Defaults to `.inactive`.
    public init(environment: EnvironmentValues = EnvironmentValues(), phase: ScenePhase = .inactive) {
        self.environment = environment
        self.phase = phase
    }
}