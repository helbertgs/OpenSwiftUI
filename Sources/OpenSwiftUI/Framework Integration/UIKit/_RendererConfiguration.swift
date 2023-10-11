import Swift

public struct _RendererConfiguration {

    // MARK: - Public Property(ies).

    public var renderer: _RendererConfiguration.Renderer
    public var minFrameInterval: Double = 30

    // MARK: - Constructor(s).

    public init(renderer: _RendererConfiguration.Renderer = .default) {
        self.renderer = renderer
    }

    // MARK: - Static Function(s).

    public static func rasterized(_ options: _RendererConfiguration.RasterizationOptions = .init()) -> _RendererConfiguration {
        .init()
    }

    // MARK: - Internal Structure(s).

    public struct RasterizationOptions {

        // MARK: - Property(ies).

        public var colorMode: ColorRenderingMode = .linear
        public var rbColorMode: Int32? = 0
        public var rendersAsynchronously: Bool = true
        public var isOpaque: Bool = false
        public var drawsPlatformViews: Bool = true
        public var prefersDisplayCompositing: Bool = true
        public var maxDrawableCount: Int = 1

        // MARK: - Constructor(s).

        public init() { }
    }

    public enum Renderer {
        case `default`
        indirect case rasterized(_: _RendererConfiguration.RasterizationOptions = .init())
    }
}
