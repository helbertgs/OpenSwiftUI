//
// DisplayList.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jul 17, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

struct DisplayList : @unchecked Sendable {

    var features: [DisplayList.Feature] = []
    var isEmpty: Bool {
        items.isEmpty
    }

    var items: [DisplayList.Item] = []
    var properties: [DisplayList.Property] = []
    var version: DisplayList.Version = .init()

    func nextUpdate(after time: Double) -> Double {
        0
    }

//    func forEachIdentity(_ arg0: (_DisplayList_Identity, inout Bool) -> Void) -> Bool {
//        fatalError("not implemented yet")
//    }

    func opaqueContentPath() -> (Path, FillStyle)? {
        fatalError("not implemented yet")
    }

//    func insertLayerFilters(matrices: [_ForegroundLayerLevel : _ColorMatrix], version: DisplayList.Version, premultiplied: Bool) {
//        fatalError("not implemented yet")
//    }

    func applyViewGraphTransform(time: Attribute<Double>, version: DisplayList.Version) {
    }

    mutating func append(contentsOf list: DisplayList) {
        items.append(contentsOf: list.items)
    }

    mutating func append(_ newElement: DisplayList.Item) {
        items.append(newElement)
    }

    mutating func transform(_ handler: (inout DisplayList.Item) -> Void) {
        for index in 0..<items.count {
            var item = items[index]
            handler(&item)
            items[index] = item
        }
    }

    func translate(by: Size3D, version: DisplayList.Version) {
        fatalError("not implemented yet")
    }

    public init() {
        self.items = []
    }

    public init(_ item: DisplayList.Item) {
        self.items = [item]
    }

    public init(_ items: [DisplayList.Item]) {
        self.items = items
    }
}

extension DisplayList :  CustomStringConvertible {
    var description: String {
        fatalError("not implemented yet")
    }
}
