//
// ControlSize.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 11, 2023.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT 

import Swift

/// The size classes, like regular or small, that you can apply to controls
/// within a view.
public enum ControlSize : String, CaseIterable, Equatable, Hashable, Sendable {

    // MARK: - Case(s).

    /// A control version that is minimally sized.
    case mini

    /// A control version that is proportionally smaller size for space-constrained views.
    case small

    /// A control version that is the default size.
    case regular

    /// A control version that is prominently sized.
    case large
}

/// A key for accessing the control size for the current environment.
///
/// The value of this key is the control size for the current environment.
struct ControlSizeKey : EnvironmentKey {

    /// The default value of the key.
    ///
    /// The default value is ``ControlSize.regular``.
    static var defaultValue: ControlSize {
        .regular
    }
}

extension EnvironmentValues {

    /// The size to apply to controls within a view.
    /// 
    /// The default is ``ControlSize.regular``.
    public var controlSize: ControlSize {
        get { self[ControlSizeKey.self] }
        set { self[ControlSizeKey.self] = newValue }
    }
}