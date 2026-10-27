//
// Shader+Option.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 22, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

extension Shader {
    
    struct Option: Equatable, Hashable, OptionSet, Sendable, SendableMetatype {
        
        var rawValue: Int
        
        init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        static var alphaOnlyLayer: Shader.Option {
            .init(rawValue: 1 << 1)
        }
        
        static var colorFilter: Shader.Option {
            .init(rawValue: 1 << 2)
        }
        
        static var distortionFilter: Shader.Option {
            .init(rawValue: 1 << 4)
        }
        
        static var dithersColor: Shader.Option {
            .init(rawValue: 1 << 8)
        }
    }
}
