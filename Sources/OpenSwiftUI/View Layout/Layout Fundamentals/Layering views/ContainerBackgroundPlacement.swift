//
//  ContainerBackgroundPlacement.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-07-27.
//

import Foundation

public struct ContainerBackgroundPlacement : Equatable, Hashable, Sendable {

    let storage: Storage

    /// A  background placement inside a ``Window`` or ``WindowGroup``
    public static let window: ContainerBackgroundPlacement = .init(storage: .init(builtin: .window))

    public static let tabView: ContainerBackgroundPlacement = .init(storage: .init(builtin: .tabView))

    public static let navigation: ContainerBackgroundPlacement = .init(storage: .init(builtin: .navigation))

    public static let navigationSplitView: ContainerBackgroundPlacement = .init(storage: .init(builtin: .navigationSplitView))

    init (storage: Storage) {
        self.storage = storage
    }
}

extension ContainerBackgroundPlacement {
    struct Storage : Equatable, Hashable, Sendable {
        let builtin: ContainerBackgroundKind.Builtin
    }
}


struct ContainerBackgroundKind {
    enum Builtin : Equatable, Hashable, Sendable {
        case window
        case tabView
        case navigation
        case navigationSplitView
    }
}
