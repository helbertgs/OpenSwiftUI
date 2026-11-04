//
// DisplayList+Transform.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

extension DisplayList {
    enum Transform {
        case projection(ProjectiveTransform3D)
        case rotation3D(Quaternion3D)
        case affine(AffineTransform3D)

        var affineTransform: AffineTransform3D? {
            switch self {
                case .affine(let value): value
                default: nil
            }
        }

        var projectionTransform: ProjectiveTransform3D? {
            switch self {
                case .projection(let value): value
                default: nil
            }
        }
    }
}
