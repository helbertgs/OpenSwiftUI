//
// ContainerShapeContext.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

struct ContainerShapeContext {
    let id: CoordinateSpace.ID
    let position: Attribute<Point3D>
    let size: Attribute<Size3D>
    let childTransform: Attribute<AffineTransform3D>

    init(id: CoordinateSpace.ID, position: Attribute<Point3D>, size: Attribute<Size3D>, childTransform: Attribute<AffineTransform3D>) {
        self.id = id
        self.position = position
        self.size = size
        self.childTransform = childTransform
    }
}
