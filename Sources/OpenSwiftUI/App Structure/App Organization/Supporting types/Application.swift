//
// App.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 6, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Foundation
import OpenGLFW
import OpenSpatial

/// An object that manages an app's main event loop and resources used by all of that app's objects.
@MainActor 
final class Application {

    // MARK: - Getting the shared app object

    /// Accessing the shared application
    @MainActor static let shared = Application()


    /// Processes the Foundation RunLoop.
    private func runLoop() {
        var time: Date?
        repeat {
            // Execute Foundation.RunLoop once and determine the next time the timer
            // fires. At this point handle all Foundation.RunLoop timers, sources and
            // Dispatch.DispatchQueue.main tasks
            time = RunLoop.main.limitDate(forMode: .default)
            
            // If Foundation.RunLoop doesn't contain any timers or the timers should
            // not be running right now, we interrupt the current loop or otherwise
            // continue to the next iteration.
        } while (time?.timeIntervalSinceNow ?? -1) <= 0
    }    
}