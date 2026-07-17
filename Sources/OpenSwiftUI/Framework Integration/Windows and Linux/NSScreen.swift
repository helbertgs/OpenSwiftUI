//
// NSScreen.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 18, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import OpenGLFW
import OpenSpatial

public protocol NSScreenDelegate : AnyObject {
    func screenDidConnect(_ screen: NSScreen)
    func screenDidDisconnect(_ screen: NSScreen)
}

/// An object that describes the attributes of a computer’s monitor or screen.
@MainActor public class NSScreen {

    // MARK: - Checking Screen Characteristics

    /// A pointer to the underlying screen object.
    private var pointer: OpaquePointer
    
    /// The delegate object for the screen.
    public weak var delegate : NSScreenDelegate?

    // MARK: - Getting Screen Objects

    /// Returns the screen object containing the window with the keyboard focus.
    public static var main: NSScreen? {
        guard let monitor = glfwGetPrimaryMonitor() else {
            return nil
        }

        return NSScreen(monitor)
    }

    /// Returns a screen object representing the screen that can best represent color.
    public static var deepest: NSScreen? = nil

    /// Returns an array of screen objects representing all of the screens available on the system.
    public static var screens: [NSScreen] {
        var count: Int32 = 0
        guard let monitors = glfwGetMonitors(&count) else { return [] }
        return (0..<Int(count)).compactMap { NSScreen(monitors[$0]!)}
    }

    // MARK: - Getting Screen Information

    /// The dimensions and location of the screen.  
    public let frame: Rect3D

    /// The localized name of the display.
    public let localizedName: String

    public let contentScale: Size3D

    // MARK: - Getting Variable Refresh Rate Details

    /// The maximum number of frames per second that the screen supports.
    public let maximumFramesPerSecond: Int = 0

    /// The shortest refresh interval that the screen supports.
    public let minimumRefreshInterval: Double = 0

    /// The largest refresh interval that the screen supports.
    public let maximumRefreshInterval: Double

    /// The number of seconds between the screen’s supported update rates, for screens that support fixed update rates.
    public let displayUpdateGranularity: Double = 0

    /// The time of the last framebuffer update, expressed as the number of seconds since system startup.
    public let lastDisplayUpdateTimestamp: Double = 0

    // MARK: - Creating a NSScreen Object

    /// Creates a new NSScreen object.
    /// 
    /// - Parameter pointer: A pointer to the underlying screen object.
    init(_ pointer: OpaquePointer) {
        self.pointer = pointer

        // Get the localized name of the screen
        if let name = glfwGetMonitorName(pointer) {
            self.localizedName = String(cString: name)
        } else {
            self.localizedName = "Unknown Monitor"
        }

        // Virtual space position from monitor
        var x: Int32 = 0
        var y: Int32 = 0
        glfwGetMonitorPos(pointer, &x, &y)

        // Current video mode
        guard let mode = glfwGetVideoMode(pointer) else {
            fatalError()
        }

        let width = Int(mode.pointee.width)
        let height = Int(mode.pointee.height)

        self.frame = Rect3D(origin: Point3D(x: Double(x), y: Double(y)), size: Size3D(width: Double(width), height: Double(height)))
        self.maximumRefreshInterval = Double(mode.pointee.refreshRate)

        // Content scale (HiDPI / Retina)
        var scaleX: Float = 1.0
        var scaleY: Float = 1.0
        glfwGetMonitorContentScale(pointer, &scaleX, &scaleY)

        contentScale = Size3D(width: Double(scaleX), height: Double(scaleY))

        // let red = mode.pointee.redBits
        // let green = mode.pointee.greenBits
        // let blue = mode.pointee.blueBits

        // print("Screen initialized: \(localizedName) - Frame: \(frame) - Color Bits (R:\(red) G:\(green) B:\(blue)) - Content Scale: \(contentScale)")
    }

    // MARK: - Callbacks

    private func setMonitorUserPointer() {
        glfwSetMonitorUserPointer(pointer, Unmanaged.passUnretained(self).toOpaque())
    }

    private func setMonitorCallback() {
        glfwSetMonitorCallback { monitor, event in
            let screen = Unmanaged<NSScreen>.fromOpaque(glfwGetMonitorUserPointer(monitor)).takeUnretainedValue()
            switch event {
            case GLFW_CONNECTED:
                screen.delegate?.screenDidConnect(screen)
            case GLFW_DISCONNECTED:
                screen.delegate?.screenDidDisconnect(screen)
            default:
                break
            }
        }
    }
}