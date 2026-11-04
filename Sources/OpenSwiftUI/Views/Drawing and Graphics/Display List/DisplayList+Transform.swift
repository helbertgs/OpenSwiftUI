//
//  Transform.swift
//  OpenSwiftUI
//
//  Created by Helbert Gomes on 2026-11-02.
//


extension DisplayList {
    public enum Transform {
        case projection(ProjectionTransform)

        case rotation3D(_Rotation3DEffect.Data)

        case affine(CGAffineTransform)

        case rotation(_RotationEffect.Data)



        public var affineTransform: CGAffineTransform? {
            fatalError("not implemented yet")
        }

        public var projectionTransform: ProjectionTransform? {
            fatalError("not implemented yet")
        }
    }
}
