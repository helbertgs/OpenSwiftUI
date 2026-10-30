//
// ContainerShapeData.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public protocol AnyContainerShapeType { }

struct ContainerShapeData {
    
    let context: ContainerShapeContext
    let shape: Attribute<any Shape>
    let type: AnyContainerShapeType.Type

    init(
        type: AnyContainerShapeType.Type, 
        shape: Attribute<any Shape>, 
        context: ContainerShapeContext, 
        isSystemShape: Bool = false
    ) {
        self.context = context
        self.shape = shape
        self.type = type
    }
}

