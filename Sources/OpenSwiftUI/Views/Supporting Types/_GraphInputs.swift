//
// _GraphInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public struct _GraphInputs {
    let accentColor: Attribute<Color?>
    let allScrollableAxes: Attribute<Axis.Set>
    var animationsDisabled: Bool = false
    let cachedEnvironment: MutableBox<CachedEnvironment>
    var changedDebugProperties: [_ViewDebug.Property] = []
    let colorScheme: Attribute<ColorScheme>
    let containerShape: Attribute<ContainerShapeData>
    let controlSize: Attribute<ControlSize>
    var customInputs: PropertyList = .init()
    let defaultPadding: Attribute<EdgeInsets>
    var disableNavigationDestination: Bool = false
    var disablePixelRounding: Bool = false
    var environment: Attribute<EnvironmentValues>
    let horizontalSizeClass: Attribute<UserInterfaceSizeClass?>
    let isDefaultStyleContext: Bool
    let isEnabled: Attribute<Bool>
    var isGlassEffectDeferred: Bool = false
    let isHoverEffectEnabled: Attribute<Bool> 
    var isInLazyContainer: Bool = false
    let isPresentingContextMenu: Attribute<Bool>
    let layoutDirection: Attribute<LayoutDirection>
    var needsDynamicLayout: Bool = false
    let needsStableDisplayListIDs: Bool = false
    let openURL: Attribute<OpenURLAction>
    var options: [_GraphInputs.Options] = []
    var phase: Attribute<_GraphInputs.Phase>
    let pixelLength: Attribute<Double>
    var platformSystem: PlatformSystemDefinition = .none
    let resolvedAppearance: Attribute<_ResolvedAppearance>
    var savedTransactions: [Attribute<Transaction>] = []
    var supportsGestureComponent: Bool = false
    var supportsVariableFrameDuration: Bool = false
    var time: Attribute<Double>
    let tintColor: Attribute<Color?>
    var transaction: Attribute<Transaction>
    var updateCycleUseSetNeedsLayout: Bool = true
    let verticalSizeClass: Attribute<UserInterfaceSizeClass?>
}