import Swift

@resultBuilder public struct SceneBuilder {
    public static func buildBlock<Content>(_ content: Content) -> Content where Content : Scene {
        content
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1>(_ c0: C0, _ c1: C1) -> some Scene where C0: Scene, C1: Scene {
        _TupleScene((c0, c1))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Scene where C0: Scene, C1: Scene, C2: Scene {
        _TupleScene((c0, c1, c2))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene {
        _TupleScene((c0, c1, c2, c3))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene {
        _TupleScene((c0, c1, c2, c3, c4))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene, C5: Scene {
        _TupleScene((c0, c1, c2, c3, c4, c5))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene, C5: Scene, C6: Scene {
        _TupleScene((c0, c1, c2, c3, c4, c5, c6))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene, C5: Scene, C6: Scene, C7: Scene {
        _TupleScene((c0, c1, c2, c3, c4, c5, c6, c7))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene, C5: Scene, C6: Scene, C7: Scene, C8: Scene {
        _TupleScene((c0, c1, c2, c3, c4, c5, c6, c7, c8))
    }

    @_alwaysEmitIntoClient
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(_ c0: C0, _ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> some Scene where C0: Scene, C1: Scene, C2: Scene, C3: Scene, C4: Scene, C5: Scene, C6: Scene, C7: Scene, C8: Scene, C9: Scene {
        _TupleScene((c0, c1, c2, c3, c4, c5, c6, c7, c8, c9))
    }
}
