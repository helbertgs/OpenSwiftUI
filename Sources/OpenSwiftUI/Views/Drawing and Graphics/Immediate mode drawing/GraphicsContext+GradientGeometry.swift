//
// GraphicsContext+GradientGeometry.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 23, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

extension GraphicsContext {
    enum GradientGeometry: Equatable, Hashable, Sendable {
        case elliptical(Rect3D, Double, Double)
        case axial(Point3D, Point3D)
        case conic(Point3D, Double)
        case radial(Point3D, Double, Double)
        case angular(Point3D, Angle2D, Angle2D)
        case radial2(Point3D, Double, Point3D, Double)
    }
}
