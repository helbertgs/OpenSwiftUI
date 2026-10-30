//
// _ViewInputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 26, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

/// The context passed into each `_makeView`.
///
/// In the real AttributeGraph this carries only layout and environment inputs —
/// never the graph itself. The graph is accessed implicitly via
/// `_GraphContext.current` inside any `rule {}` or `input()` invoked during `_makeView`.
@MainActor
public struct _ViewInputs {
    
    var base: _GraphInputs
    var environment: Attribute<EnvironmentValues> {
        get { base.environment }
        set { base.environment = newValue }
    }
    var isEnabled: Attribute<Bool> {
        base.isEnabled
    }
    var needsDynamicLayout: Bool {
        get { base.needsDynamicLayout }
        set { base.needsDynamicLayout = newValue }
    }
    var needsGeometry: Bool = true
    var needsLayout: Bool = true
    var position: Attribute<Point3D>
    var size: Attribute<Size3D>
    var transaction: Attribute<Transaction> {
        get { base.transaction }
        set { base.transaction = newValue }
    }


    init(
        base: _GraphInputs,
        position: Attribute<Point3D>,
        size: Attribute<Size3D>
    ) {
        self.base = base
        self.position = position
        self.size = size
    }
}
