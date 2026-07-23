//
// _SceneOutputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenSpatial

enum WindowSizeResolutionSource {
    case defaultRequest
    case contentFitting
    case runtimeResize
}

/// The result of `_makeScene`, containing the scene's view graph and window metadata.
///
/// The `AppGraph` uses these outputs to register the `ViewGraph` in its list of
/// active graphs, pass the `ViewGraph` to the `Application` for rendering,
/// and propagate future environment and `ScenePhase` changes.
public struct _SceneOutputs {

    // MARK: - Checking characteristics

    /// The view graph built by the scene.
    var viewGraph: ViewGraph

    /// The identifier of the scene.
    var id: String = UUID().uuidString

    /// The type of the scene.
    var type: String = ""

    var title: String = ""

    /// The scene that this output represents.
    var scene: (any Scene)? = nil

    // MARK: - Creating background tasks

    /// The background tasks for the scene.
    var backgroundTasks: [Task<Void, Never>] = []

    // MARK: - Managing app storage

    /// The app storage for the scene.
    var appStorage: UserDefaults = .standard

    // MARK: - Setting commands

    // MARK: - Sizing and positioning the scene

    /// The position of the scene.
    var position: Point3D = .zero

    var size: Size3D = .init(width: 900, height: 450, depth: 0)

    /// The ideal size of the scene.
    var idealSize: Size3D = .zero

    /// The placement of the scene.
   var placement: WindowPlacement = .init()

    /// The resizability of the scene.
    var resizability: WindowResizability = .contentSize

    /// The manage role of the scene.
    var manageRole: WindowManagerRole = .automatic

    // MARK: - Configuring scene visibility

    /// The launch behavior of the scene.
    var launchBehavior: SceneLaunchBehavior = .automatic

    /// The restoration behavior of the scene.
    var restorationBehavior: SceneRestorationBehavior = .automatic

    // MARK: - Styling the scene

    /// The style of the scene.
    var style: any WindowStyle = DefaultWindowStyle()

    /// The toolbar style of the scene.
    var windowToolbarStyle: any WindowToolbarStyle = .automatic

    var toolbarLabelStyle: ToolbarLabelStyle = .automatic

    var menuBarExtraStyle: MenuBarExtraStyle = .automatic

    // MARK: - Managing the environment

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues = .init()

    /// The accumulated preference values produced by scene/view modifiers.
    var preferenceValues: PreferenceValues = .init()

    // MARK: - Interacting with dialogs

    /// The icon of the dialog.
    var dialogIcon: Any? = nil

    /// The severity of the dialog.
    var dialogSeverity: DialogSeverity = .automatic

    // MARK: - Managing Hierarchical Relationships

    /// The children of this scene output.
    var children: [_SceneOutputs] = []
}