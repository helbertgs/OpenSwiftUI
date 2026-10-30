//
// _GraphInputs+Options.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension _GraphInputs {
    enum Options : String, Codable, CaseIterable, Equatable, Hashable, Sendable {
        case animationsDisabled
        case disablePixelRounding
        case doNotScrape
        case isInReferenceTypeContext
        case needsAccessibility
        case needsDynamicLayout
        case needsStableDisplayListIDs
        case supportsVariableFrameDuration
        case viewDisplayListAccessibility
        case viewNeedsGeometry
        case viewNeedsGeometryAccessibility
        case viewRequestsLayoutComputer
        case viewStackOrientationIsDefined
        case viewStackOrientationIsHorizontal    
    }
}