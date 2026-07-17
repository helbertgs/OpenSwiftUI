//
// _Graph.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jun 11, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public struct _Graph {
    var storage : Storage

    init(_ storage: Storage) {
        self.storage = storage
    }
}

extension _Graph {
    enum Storage {
        case empty
        case scene(SceneGraph)
        case view(ViewGraph)
    }
}
