//
// ViewRendererHost.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

typealias EventID = String
typealias EventType = String

protocol ViewRendererHost {

    var viewGraph: ViewGraph { get }
    var centersRootView: Bool { get set }
    var isRootHost: Bool { get }
    var nextGestureUpdateTime: Double { get }
    var rootSizeInfo: RootSizeInfo? { get }

    func updateViewGraph<A>(body: (ViewGraph) -> A) -> A
    func sizeThatFits(_ proposedSize: ProposedViewSize) -> Size3D
    func preferenceValue<A>(_ type: A.Type) -> A where A: HostPreferenceKey
    func explicitAlignment(of alignment: HorizontalAlignment, at size: Size3D) -> Double?
    func explicitAlignment(of alignment: VerticalAlignment, at size: Size3D) -> Double?
    func advanceTimeForTest(interval: Double)
    func performExternalUpdate(_ update: () -> Void)
    func `as`<A>(_ type: A.Type) -> A?
    func alignment(of alignment: VerticalAlignment, at: Size3D) -> Double?
    func alignment(of alignment: HorizontalAlignment, at: Size3D) -> Double?
    func didRender()
    func idealSize() -> Size3D

//    func sendEvents(_ events: [EventID : EventType], rootNode: ResponderNode, at: Double) -> GesturePhase<()>

    func archiveJSON(name: String?)
    func resetEvents()
    func resetProfile()

//    func scrapeContent() -> ScrapeableContent

    func stopProfiling()
    func sendTestEvents(_ events: [EventID: EventType])
    func startProfiling()

//    func gestureCategory() -> GestureCategory?

    func resetTestEvents()
    func rootContentPath(kind: ContentShapeKind, observer: ContentPathObserver?) -> Path
}

extension ViewRendererHost {

    var isRootHost: Bool {
        false
    }

    var nextGestureUpdateTime: Double {
        0
    }

    var rootSizeInfo: RootSizeInfo? {
        nil
    }

    func updateViewGraph<A>(body: (ViewGraph) -> A) -> A {
        body(viewGraph)
    }

    func sizeThatFits(_ proposedSize: ProposedViewSize) -> Size3D {
        .zero
    }

    func preferenceValue<A>(_ type: A.Type) -> A where A : HostPreferenceKey {
        fatalError()
    }

    func explicitAlignment(of alignment: HorizontalAlignment, at size: Size3D) -> Double? {
        nil
    }

    func explicitAlignment(of alignment: VerticalAlignment, at size: Size3D) -> Double? {
        nil
    }

    func advanceTimeForTest(interval: Double) {
    }

    func performExternalUpdate(_ update: () -> Void) {
        update()
    }

    func alignment(of alignment: VerticalAlignment, at: OpenSpatial.Size3D) -> Double? {
        nil
    }

    func alignment(of alignment: HorizontalAlignment, at: OpenSpatial.Size3D) -> Double? {
        nil
    }

    func didRender() {
    }

    func idealSize() -> Size3D {
        .one
    }

    func archiveJSON(name: String?) {
    }

    func resetEvents() {
    }

    func resetProfile() {
    }

    func stopProfiling() {
    }

    func sendTestEvents(_ events: [EventID : EventType]) {
    }

    func startProfiling() {
    }

    func resetTestEvents() {
    }

    func rootContentPath(kind: ContentShapeKind, observer: (any ContentPathObserver)?) -> Path {
        .init()
    }
}
