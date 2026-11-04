//
//  Renderer.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-11-02.
//


extension _RendererConfiguration {
    public enum Renderer {
        case rasterized(_RendererConfiguration.RasterizationOptions)

        case `default`

    }
}
