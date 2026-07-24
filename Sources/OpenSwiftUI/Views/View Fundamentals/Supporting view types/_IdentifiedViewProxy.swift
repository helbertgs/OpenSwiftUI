//
// _IdentifiedViewProxy.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 25, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenSpatial

public struct _IdentifiedViewProxy {
    public var identifier: AnyHashable
    public var boundingRect: Rect3D { .zero }
}
