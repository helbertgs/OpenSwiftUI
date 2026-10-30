//
// UpdateGroup.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Synchronization

final class UpdateGroup : @unchecked Sendable {

    @MainActor static var current: UpdateGroup?
    static let locked: UpdateGroup.Locked = .init()
    static let main: UpdateGroup = .init(queue: .main, order: .mainViewGraph, label: "openswiftui.usergroup.main")
    static let threadIsUpdating: Bool = false

    let order: UpdateGroup.Order
    let queue: DispatchQueue
    var canDispatch: Bool = true
    var isActive: Bool = false
    var isMain: Bool = false
    var isOwner: Bool = false
    var label: String = ""

    private let _lock = NSLock()

    var actions: [DispatchWorkItem] = []


    func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, action: @escaping () -> Void) -> Int {
        queue.schedule(action)
        return 0
    }

    static func enqueueAction(reason: CustomEventTrace.ActionEventType.Reason?, action: () -> Void) -> Int {
        return 0
    }

    func assertIsActive() {
    }

    func assertIsLocked() {
    }

    static func assertIsLocked() {
    }

    func dispatchActions() {
        for action in actions {
            queue.sync(execute: action)
        }

        actions.removeAll()
    }

    func dispatchImmediately<A>(reason: CustomEventTrace.ActionEventType.Reason?, _ action: () -> A) -> A {
        fatalError("not implemented yet")
    }

    static func dispatchImmediately<A>(reason: CustomEventTrace.ActionEventType.Reason?, _ action: () -> A) -> A {
        fatalError("not implemented yet")
    }

    func end() {
        queue.suspend()
    }

    func lock() {
        _lock.lock()
    }

    func wait() {
    }

    func begin() {
        fatalError("not implemented yet")
    }

    init(queue: DispatchQueue, order: UpdateGroup.Order, label: String) {
        self.queue = queue
        self.order = order
        self.label = label
    }

    func ensure<A>(_ action: () throws -> A) throws -> A {
        fatalError("not implemented yet")
    }

    func locked<A>(_ action: @escaping () throws -> A) throws -> A {
        try _lock.withLock(action)
    }

    func unlock() {
        _lock.unlock()
    }

    func syncMain(_ action: () -> Void) {
        UpdateGroup.main.queue.sync(execute: action)
    }

    func asyncMain(_ action: @Sendable @escaping () -> Void) {
        UpdateGroup.main.queue.async(execute: action)
    }

    func broadcast() {
        fatalError("not implemented yet")
    }
}

extension UpdateGroup {
    enum Order : Codable, Comparable, Equatable, Hashable, Sendable {
        case mainViewGraph
        case secondaryViewGraph
    }
}

extension UpdateGroup {
    struct Locked {
        func next() -> UpdateGroup? {
            nil
        }
    }
}



extension CustomEventTrace {
    enum ActionEventType : Equatable, Hashable, Sendable {
        case gestureMetadata
        case start
        case finish
        case enqueue
    }
}

extension CustomEventTrace.ActionEventType {
    enum Reason {
        case navStackPop
        case onDisappear
        case hoverChanged
        case navStackPush
        case scrollChanged
        case viewModelLoad
        case onFocusChanged
        case scrollPrefetch
        case signalPrefetch
        case viewModelUnload
        case viewModelUpdate
        case animationRemoved
        case didReleaseButton
        case preferenceChange
        case navSelectionUpdate
        case animationLogicallyCompleted
        case splitSidebarVisibilityChanged
        case gesture
        case onAppear
        case onChange
    }
}
