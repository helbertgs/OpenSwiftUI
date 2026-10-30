//
// ViewGraph+Outputs.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 19, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension ViewGraph {
    struct Outputs : Equatable, Hashable, OptionSet, Sendable {
        let rawValue: Int

        init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}

extension ViewGraph.Outputs {
    static var all: ViewGraph.Outputs {
        [.defaults, .displayList, focus, layout, platformItemList, viewResponders]
    }

    static var defaults: ViewGraph.Outputs {
        .init(rawValue: 1 << 1)
    }

    static var displayList: ViewGraph.Outputs {
        .init(rawValue: 1 << 2)
    }

    static var focus: ViewGraph.Outputs {
        .init(rawValue: 1 << 4)
    }

    static var layout: ViewGraph.Outputs {
        .init(rawValue: 1 << 8)
    }

    static var platformItemList: ViewGraph.Outputs {
        .init(rawValue: 1 << 16)
    }

    static var viewResponders: ViewGraph.Outputs {
        .init(rawValue: 1 << 32)
    }
}
