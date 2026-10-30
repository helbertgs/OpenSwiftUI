//
// AnyShapeStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 28, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

struct AnyShapeStyle : Equatable, Hashable, Sendable {
    let storage: Storage

    func `as`<T>(type: T.Type) -> T? where T : ShapeStyle {
        guard let style = storage as? AnyShapeStyleBox<T> else {
            return nil
        }

        return style.value
    }

    init<T>(style: T) where T: ShapeStyle {
        storage = AnyShapeStyleBox(value: style)
    }

    /// Evaluate to a resolved shape style given the current `environment`.
    func resolve(in environment: EnvironmentValues) -> Never {
        fatalError()
    }
}

extension AnyShapeStyle {
    class Storage : Equatable, Hashable, @unchecked Sendable {

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }

        static func == (lhs: Storage, rhs: Storage) -> Bool {
            ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
        }
    }

    class AnyShapeStyleBox<Value> : Storage, @unchecked Sendable where Value : ShapeStyle {
        let value: Value

        init(value: Value) {
            self.value = value
        }
    }
}