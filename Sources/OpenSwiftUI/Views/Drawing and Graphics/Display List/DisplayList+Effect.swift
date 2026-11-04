//
// DisplayList+Effect.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

extension DisplayList {
    enum Effect : @unchecked Sendable {
        case properties([DisplayList.Property])
        case accessibility(DisplayList.AccessibilityEffect)
        case backdropGroup(DisplayList.BackdropGroup)
        case geometryGroup
//        case platformGroup(PlatformGroupFactory)
        case compositingGroup
        case interpolatorRoot(DisplayList.InterpolatorGroup, Point3D, Size3D)
//        case contentTransition(ContentTransition.State)
        case interpolatorLayer(DisplayList.InterpolatorGroup, Int)
        case interpolatorAnimation(DisplayList.InterpolatorAnimation)
        case clip(Path, FillStyle, GraphicsContext.ClipOptions)
        case mask(DisplayList, GraphicsContext.ClipOptions)
        case view(_DisplayList_ViewFactory)
        case state(AnyHashable)
        case filter(GraphicsContext.Filter)
        case archive(DisplayList.ArchiveIDs?)
        case opacity(Double)
        case identity
        case shape(any Shape)
        case animation(_DisplayList_AnyEffectAnimation)
        case blendMode(GraphicsContext.BlendMode)
        case transform(DisplayList.Transform)
    }
}
