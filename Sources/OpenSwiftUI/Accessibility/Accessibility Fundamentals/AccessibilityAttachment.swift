//
// AccessibilityAttachment.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 21, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

public struct AccessibilityAttachment {
    var properties: AccessibilityProperties
    var platformElement: (any PlatformAccessibilityElementProtocol)?

    init(properties: AccessibilityProperties, platformElement: (any PlatformAccessibilityElementProtocol)?) {
        self.properties = properties
        self.platformElement = platformElement
    }
}