# OpenSwiftUI

[![CI](https://github.com/helbertgs/OpenSwiftUI/actions/workflows/CI.yml/badge.svg)](https://github.com/helbertgs/OpenSwiftUI/actions/workflows/CI.yml)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/0cdb7c84c14a4e709e938a65ff87e2e4)](https://www.codacy.com/gh/helbertgs/OpenSwiftUI/dashboard?utm_source=github.com&utm_medium=referral&utm_content=helbertgs/OpenSwiftUI&utm_campaign=Badge_Grade)
![Swift](https://img.shields.io/badge/Swift-6.0%20%7C%206.1%20%7C%206.2%20%7C%206.3-orange.svg) ![Platforms](https://img.shields.io/badge/Platforms-macOS%20%7C%20Linux%20%7C%20Windows-blue)
![OpenGL](https://badgen.net/badge/OpenGL/3.3+/blue)
![License](https://badgen.net/badge/license/MIT/green)

> A faithful, cross-platform open-source reimplementation of Apple’s SwiftUI — built without any Apple frameworks.

---

## Overview

OpenSwiftUI is an open-source Swift framework that faithfully mirrors the API and behavior of Apple’s SwiftUI, designed from the ground up to run on **any platform**. Because it deliberately avoids all Apple-specific frameworks, it can target Windows, Linux, and macOS using a single, unified codebase.

The framework provides views, controls, and layout structures for declaring your app’s user interface, along with event handlers, data flow tools, and modifiers — all following the SwiftUI programming model you already know.

---

## Why OpenGL?

OpenSwiftUI uses **OpenGL 3.3+** as its sole rendering backend. OpenGL has broad, stable support across all major operating systems (Windows, Linux, macOS), making it the ideal foundation for a truly cross-platform renderer. A single rendering engine means consistent visual output everywhere, with no platform-specific rendering paths to maintain.

---

## Dependencies

OpenSwiftUI is built on a family of cross-platform Swift libraries, each wrapping a well-established C/C++ library while exposing an idiomatic Swift API:

| Library | Based on | Purpose |
|---|---|---|
| [OpenGLAD](https://github.com/helbertgs/OpenGLAD) | [GLAD 2](https://github.com/Dav1dde/glad) (C++) | Loads OpenGL 3.3+ function pointers — primary rendering backend |
| [OpenGLFW](https://github.com/helbertgs/OpenGLFW) | [GLFW 3](https://www.glfw.org) (C++) | Window creation and OpenGL context management |
| [OpenSTB](https://github.com/helbertgs/OpenSTB) | [stb](https://github.com/nothings/stb) (C++) | Image loading, writing, and resizing |
| [OpenFreeType](https://github.com/helbertgs/OpenFreeType) | [FreeType](https://freetype.org) + [HarfBuzz](https://harfbuzz.github.io) (C++) | Font loading, shaping, and rendering via OpenGL |
| [OpenSpatial](https://github.com/helbertgs/OpenSpatial) | Apple’s [Spatial](https://developer.apple.com/documentation/spatial) framework | 3D spatial math and geometry — replaces CoreGraphics and simd |

All of these libraries were created by [@helbertgs](https://github.com/helbertgs).

---

## Requirements

| Requirement | Minimum Version |
|---|---|
| Swift | 6.0 |
| OpenGL | 3.3+ |
| Windows | Latest |
| Ubuntu | Latest |
| macOS | 15.0 |

---

## Installation

Add OpenSwiftUI to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/helbertgs/OpenSwiftUI", branch: "main"),
]
```

Then add `"OpenSwiftUI"` to your target’s dependencies.

---

## Usage

OpenSwiftUI mirrors Apple’s SwiftUI API. If you have experience with SwiftUI, you’ll feel right at home:

```swift
import OpenSwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
    }
}
```

---

## Contributing

Contributions are welcome! Anyone can contribute — just follow the [Code of Conduct](CODE_OF_CONDUCT.md) and, if you are submitting code or using an automated coding agent, read [AGENTS.md](AGENTS.md) for repository-specific workflow, scope, and validation guidance before opening a pull request.

---

## License

OpenSwiftUI is released under the **MIT License**. See [LICENSE](LICENSE) for details.
