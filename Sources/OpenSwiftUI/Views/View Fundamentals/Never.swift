//
// Never.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Apr 21, 2022.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Swift

extension Never {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Property(ies).

    public var body: Never { fatalError() }
}

extension Never : Commands { }
extension Never : View {
    public static func _makeView(view: _GraphValue<Never>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }
}
extension Never : WidgetConfiguration { }
extension Never : Widget { }

extension Never : Scene {
    public static func _makeScene(scene: _GraphValue<Never>, inputs: _SceneInputs) -> _SceneOutputs {
        fatalError()
    }
}
