//
// Shader+ShapeStyle.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 02, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

@preconcurrency 
import OpenGLAD

extension Shader : ShapeStyle {
    
    public func resolve(in environment: EnvironmentValues) -> Resolved {
        .init(
            vertex: "",
            fragment: ""
        )
    }
    
    /// The type of shape style this will resolve to.
    ///
    /// When you create a custom shape style, Swift infers this type
    /// from your implementation of the required `resolve` function.
    ///
    /// A reference to a function in a OpenGL shader library, along with its bound uniform argument values.
    public struct Resolved : Equatable, Hashable, Sendable, ShapeStyle {

        // MARK: - Getting the characteristics of the Shader

        /// The GLSL program.
        private(set) var id: Int = 0

        // MARK: - Creating a shader

        /// Create a new shader program using Vertex and Fragment shader
        ///
        /// - Parameters:
        ///   - vertex: Vertex Shader
        ///   - fragment: Fragment Shader
        init(vertex vs: String, fragment fs: String) {
            let vertex = compile(shader: vs, type: .vertex)
            let fragment = compile(shader: fs, type: .fragment)

            createProgram(vertex, fragment)
        }

        /// Create a new shader program using Vertex, Fragment and Geometry shader
        ///
        /// - Parameters:
        ///   - code: The shader source code.
        ///   - type: The type of shader to create.
        /// - Returns: The ID of the compiled shader.
        private func compile(shader code: String, type: ShaderType) -> UInt32 {
            let shader = glad_glCreateShader(type.rawValue)
            code.withCString { (pointer: UnsafePointer<Int8>) in
                let shaderSource = UnsafePointer<CChar>(pointer)
                var shaderSourcePointer: UnsafePointer<GLchar>? = shaderSource
                glad_glShaderSource(shader, 1, &shaderSourcePointer, nil)
            }

            glad_glCompileShader(shader)
            debug(shader: shader)
            
            return shader
        }

        /// Debugs a shader by checking its compile status and printing any error messages.
        ///
        /// - Parameter shader: The ID of the shader to debug.
        private func debug(shader: UInt32) {
            var success: Int32 = 0
            var infoLog = [CChar](repeating: 0, count: 1024)

            glad_glGetShaderiv(shader, UInt32(GL_COMPILE_STATUS), &success)

            if success == GL_FALSE {
                glad_glGetShaderInfoLog(shader, 1024, nil, &infoLog)
                print("Shader compilation failed:\n\(String(utf8String: infoLog) ?? "")")
            }
        }

        /// Debugs a shader program by checking its link status and printing any error messages.
        ///
        /// - Parameter program: The ID of the shader program to debug.
        private func debug(program: UInt32) {
            var success: Int32 = 0
            var infoLog = [CChar](repeating: 0, count: 1024)

            glad_glGetProgramiv(program, UInt32(GL_LINK_STATUS), &success)

            if success == GL_FALSE {
                glad_glGetProgramInfoLog(program, 1024, nil, &infoLog)
                print("Program linking failed:\n\(String(utf8String: infoLog) ?? "")")
            }
        }

        /// Creates a new shader program by linking the specified vertex and fragment shaders.
        ///
        /// - Parameters:
        ///   - vs: The vertex shader ID.
        ///   - fs: The fragment shader ID.
        private mutating func createProgram(_ vs: UInt32, _ fs: UInt32) {
            let program = glad_glCreateProgram()
            self.id = Int(program)
            
            linkProgram(vs, fs)
            debug(program: program)

            print("Shader ID: \(self.id)")
        }

        /// Links the specified vertex and fragment shaders into a shader program.
        ///
        /// - Parameters:
        ///   - vs: The vertex shader ID.
        ///   - fs: The fragment shader ID.
        private func linkProgram(_ vs: UInt32, _ fs: UInt32) {
            let program = UInt32(id)
            glad_glAttachShader(program, vs)
            glad_glAttachShader(program, fs)
            glad_glLinkProgram(program)

            delete(shader: vs)
            delete(shader: fs)
        }

        /// Deletes the specified shader from the OpenGL context.
        ///
        /// - Parameter shader: The ID of the shader to delete.
        private func delete(shader: UInt32) {
            glad_glDeleteShader(shader)
        }

        /// Activates the shader program for use in subsequent OpenGL rendering operations.
        func use() {
            glad_glUseProgram(UInt32(id))
        }
        
        public func resolve(in environment: EnvironmentValues) -> Never {
            fatalError()
        }
    }
}

extension Shader.Resolved {

    /// The GLSL Shader type.
    enum ShaderType {

        /// The vertex shader
        case vertex

        /// The fragment shader
        case fragment

        // The geometry shader
        case geometry

        var rawValue: UInt32 {
            return switch self {
                case .vertex: GLenum(GL_VERTEX_SHADER)
                case .fragment: GLenum(GL_FRAGMENT_SHADER)
                case .geometry: GLenum(GL_GEOMETRY_SHADER)
            }
        }
    }
}

extension Shader.Resolved {
    func draw(path: Path, style: PathDrawingStyle, in context: inout GraphicsContext, bounds: Rect3D) {
    }
}
