//
// CustomEventTrace.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import Synchronization

struct CustomEventTrace {
    static var isEnabled: Bool {
        fatalError("not implemented yet")
    }

    static func getNextTraceID(id: consuming Atomic<Int>) -> Int {
        fatalError("not implemented yet")
    }

    static func instantiate<A>(root: Subgraph, closure: () -> A) -> A {
        fatalError("not implemented yet")
    }

    static func startAction(_ index: Int, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        fatalError("not implemented yet")
    }

    static func animationEnd(_ attribute: AnyAttribute?) {
        fatalError("not implemented yet")
    }

    static func finishAction(_ index: Int, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        fatalError("not implemented yet")
    }

    static func animationTick(onMain: Bool, time: Double) {
        fatalError("not implemented yet")
    }

    static func enqueueAction(_ index: Int, _ reason: CustomEventTrace.ActionEventType.Reason?) {
        fatalError("not implemented yet")
    }

    static func uninstantiate<A>(root: Subgraph, closure: () -> A) -> A {
        fatalError("not implemented yet")
    }

    static func additionalInfo(_ index: Int, info: AnyAttribute?) {
        fatalError("not implemented yet")
    }

    static func animationBegin(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
        fatalError("not implemented yet")
    }

    static func instantiateEnd(_ subgraph: Subgraph) {
        fatalError("not implemented yet")
    }

    static func setNeedsUpdate(values: ViewGraphRootValues, graph: Graph) {
        fatalError("not implemented yet")
    }

    static func transactionEnd(_ index: Int) {
        fatalError("not implemented yet")
    }

    static func instantiateBegin(_ subgraph: Subgraph) {
        fatalError("not implemented yet")
    }

    static func transactionBegin(_ index: Int) {
        fatalError("not implemented yet")
    }

    static func animationRetarget(attribute: AnyAttribute?, propertyType: Any.Type, function: Animation.Function) {
        fatalError("not implemented yet")
    }

    static func dynamicBodyUpdate(buffer: _DynamicPropertyBuffer, hasValue: Bool, bodyChanged: Bool) {
        fatalError("not implemented yet")
    }

    static func isCategoryEnabled(_ category: CustomEventCategory) -> Bool {
        fatalError("not implemented yet")
    }

    static func transactionAppend(to: Int) {
        fatalError("not implemented yet")
    }

    static func setEnabledCategory(_ category: CustomEventCategory, enabled: Bool) {
        fatalError("not implemented yet")
    }

    static func transactionEnqueue(_ index: Int) {
        fatalError("not implemented yet")
    }

    static func animationAttrUpdate(_ attribute: AnyAttribute?) {
        fatalError("not implemented yet")
    }

    static func recordGraphHostRoot(_ graph: Graph?, _ subgraph: Subgraph, newRoot: Subgraph, _ host: GraphHost) {
        fatalError("not implemented yet")
    }

    static func recordNamedProperty<A>(_ values: ViewGraphRootValues, _ attribute: Attribute<A>) -> Attribute<A> {
        fatalError("not implemented yet")
    }

    static func animationScheduleTick(attribute: AnyAttribute?, time: Double) {
        fatalError("not implemented yet")
    }

    static func observableFireWithTransaction(transaction: Int, key: AnyKeyPath?, attribute: AnyAttribute) {
        fatalError("not implemented yet")
    }

    static func transactionContinueAsContinuation(_ host: GraphHost) {
        fatalError("not implemented yet")
    }

    static func transactionContinueAsNewTransaction(_ index: Int) {
        fatalError("not implemented yet")
    }

    static func trace<A>(_ category: CustomEventCategory, _ index: Int, value: A) {
        fatalError("not implemented yet")
    }

    static func register(graph: Graph) {
        fatalError("not implemented yet")
    }
}
