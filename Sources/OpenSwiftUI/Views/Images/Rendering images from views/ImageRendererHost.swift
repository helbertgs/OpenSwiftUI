//
// ImageRendererHost.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Nov 2, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

import OpenSpatial

final class ImageRendererHost : ViewRendererHost {

    var centersRootView: Bool = true


    var _platformImage: AnyObject? = nil
    var image: Image? = nil

    var imageScale: Double = 0

    var imageSize: Size3D = .zero
    var currentTimestamp: Double = 0
    var externalUpdateCount: Int = 0
    var renderingPhase: ViewRenderingPhase = .none
    var valuesNeedingUpdate: ViewGraphRootValues = .init()
    var viewGraph: ViewGraph

    init(viewGraph: ViewGraph) {
        self.viewGraph = viewGraph
    }

    func updateSize() {
    }

    func requestUpdate(after time: Double) {
    }

    func updateRootView() {
    }

    func updateSafeArea() {
    }

    func updateEnvironment() {
    }

    func updateContainerSize() {
    }

    func `as`<A>(_ type: A.Type) -> A? {
        nil
    }
}

