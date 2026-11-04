//
// HostingLayer.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import Foundation
import OpenSpatial

class _HostingLayer<Content> : ViewRendererHost where Content : View {

    var centersRootView: Bool = true

    var currentTimestamp: Double = 0
    // var eventBindingManager: EventBindingManager
    var externalUpdateCount: Int = 0

    // var focusedResponder: ResponderNode? = nil

    var referenceInstant: ContinuousClock.Instant = .now

    var renderingPhase: ViewRenderingPhase
    var renderingRootView: AnyObject {
        fatalError("not implemented yet")
    }

    let updateGroup: UpdateGroup

    var valuesNeedingUpdate: ViewGraphRootValues = .init()
    let viewGraph: ViewGraph

    func updateSize() {
        fatalError("not implemented yet")
    }

    init(updateGroup: UpdateGroup, rootView: Content, environment: EnvironmentValues) {
        fatalError("not implemented yet")
    }

    init(detachedRootView: Content, queue: DispatchQueue, environment: EnvironmentValues) {
        fatalError("not implemented yet")
    }

    init(rootView: Content, environment: EnvironmentValues) {
        fatalError("not implemented yet")
    }

    init() {
        fatalError("not implemented yet")
    }

    func convertAnchor<A>(_ anchor: Anchor<A>) -> A {
        fatalError("not implemented yet")
    }

    func requestUpdate(after: Double) {
        fatalError("not implemented yet")
    }

    func setNeedsUpdate() {
        fatalError("not implemented yet")
    }

    func updateRootView() {
        fatalError("not implemented yet")
    }

    func updateSafeArea() {
        fatalError("not implemented yet")
    }

//    func preferenceValue<A>(_ type: A.Type) -> A.Value where A: HostPreferenceKey {
//        fatalError("not implemented yet")
//    }

    func updateEnvironment() {
        fatalError("not implemented yet")
    }

    func updateContainerSize() {
        fatalError("not implemented yet")
    }

    func updateRenderContext(_ context: inout ViewGraphRenderContext) {
        fatalError("not implemented yet")
    }

    func preferencesDidChange() {
        fatalError("not implemented yet")
    }

    func renderIntervalForDisplayLink(timestamp: Double) -> Double {
        fatalError("not implemented yet")
    }

    func `as`<A>(_ type: A.Type) -> A? {
        fatalError("not implemented yet")
    }
}
