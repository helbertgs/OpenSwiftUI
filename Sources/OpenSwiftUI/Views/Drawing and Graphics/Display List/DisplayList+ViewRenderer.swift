//
// DisplayList+ViewRenderer.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT
//

extension DisplayList {
    struct ViewRenderer {
        let configuration: _RendererConfiguration = .init(renderer: .default)
        var host: ViewRendererHost? = nil
        var viewCacheIsEmpty: Bool = false

        func renderAsync(to: DisplayList, time: Double, nextTime: Double, targetTimestamp: Double?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Double? {
            nil
        }

        func exportedObject(rootView: AnyObject) -> AnyObject? {
            nil
        }

        func render(rootView: AnyObject, from: DisplayList, time: Double, nextTime: Double, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Double {
            0
        }

        init(platform: DisplayList.ViewUpdater.Platform) {
        }
    }
}

extension DisplayList.ViewRenderer {
    struct Environment {
    }
}
