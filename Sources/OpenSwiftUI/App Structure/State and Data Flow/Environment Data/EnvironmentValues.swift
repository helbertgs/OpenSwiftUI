import Swift

// A collection of environment values propagated through a view hierarchy.
///
/// OpenSwiftUI exposes a collection of values to your app's views in an
/// `EnvironmentValues` structure. To read a value from the structure,
/// declare a property using the ``Environment`` property wrapper and
/// specify the value's key path. For example, you can read the current locale:
///
///     @Environment(\.locale) var locale: Locale
///
/// Use the property you declare to dynamically control a view's layout.
/// OpenSwiftUI automatically sets or updates many environment values, like
/// ``EnvironmentValues/pixelLength``, ``EnvironmentValues/scenePhase``, or
/// ``EnvironmentValues/locale``, based on device characteristics, system state,
/// or user settings. For others, like ``EnvironmentValues/lineLimit``, OpenSwiftUI
/// provides a reasonable default value.
///
/// You can set or override some values using the ``View/environment(_:_:)``
/// view modifier:
///
///     MyView()
///         .environment(\.lineLimit, 2)
///
/// The value that you set affects the environment for the view that you modify
/// --- including its descendants in the view hierarchy --- but only up to the
/// point where you apply a different environment modifier.
///
/// OpenSwiftUI provides dedicated view modifiers for setting some values, which
/// typically makes your code easier to read. For example, rather than setting
/// the ``EnvironmentValues/lineLimit`` value directly, as in the previous
/// example, you should instead use the ``View/lineLimit(_:)`` modifier:
///
///     MyView()
///         .lineLimit(2)
///
/// In some cases, using a dedicated view modifier provides additional
/// functionality. For example, you must use the
/// ``View/preferredColorScheme(_:)`` modifier rather than setting
/// ``EnvironmentValues/colorScheme`` directly to ensure that the new
/// value propagates up to the presenting container when presenting a view
/// like a popover:
///
///     MyView()
///         .popover(isPresented: $isPopped) {
///             PopoverContent()
///                 .preferredColorScheme(.dark)
///         }
///
/// Create custom environment values by defining a type that
/// conforms to the ``EnvironmentKey`` protocol, and then extending the
/// environment values structure with a new property. Use your key to get and
/// set the value, and provide a dedicated modifier for clients to use when
/// setting the value:
///
///     private struct MyEnvironmentKey: EnvironmentKey {
///         static let defaultValue: String = "Default value"
///     }
///
///     extension EnvironmentValues {
///         var myCustomValue: String {
///             get { self[MyEnvironmentKey.self] }
///             set { self[MyEnvironmentKey.self] = newValue }
///         }
///     }
///
///     extension View {
///         func myCustomValue(_ myCustomValue: String) -> some View {
///             environment(\.myCustomValue, myCustomValue)
///         }
///     }
///
/// Clients of your value then access the value in the usual way, reading it
/// with the ``Environment`` property wrapper, and setting it with the
/// `myCustomValue` view modifier.
public struct EnvironmentValues : CustomStringConvertible, DynamicProperty {

    // MARK: - Type Alias.

    private typealias PropertyList = [ObjectIdentifier : Any]

    // MARK: - Private Property(ies).
    private var _plist: PropertyList

    // MARK: - Public Constructor(s).
    /// Creates an environment values instance.
    ///
    /// You don't typically create an instance of ``EnvironmentValues``
    /// directly. Doing so would provide access only to default values that
    /// don't update based on system settings or device characteristics.
    /// Instead, you rely on an environment values' instance
    /// that OpenSwiftUI manages for you when you use the ``Environment``
    /// property wrapper and the ``View/environment(_:_:)`` view modifier.
    public init() { _plist = PropertyList() }

    // MARK: - Public Subscript(s).
    /// Accesses the environment value associated with a custom key.
    ///
    /// Create custom environment values by defining a key
    /// that conforms to the ``EnvironmentKey`` protocol, and then using that
    /// key with the subscript operator of the ``EnvironmentValues`` structure
    /// to get and set a value for that key:
    ///
    ///     private struct MyEnvironmentKey: EnvironmentKey {
    ///         static let defaultValue: String = "Default value"
    ///     }
    ///
    ///     extension EnvironmentValues {
    ///         var myCustomValue: String {
    ///             get { self[MyEnvironmentKey.self] }
    ///             set { self[MyEnvironmentKey.self] = newValue }
    ///         }
    ///     }
    ///
    /// You use custom environment values the same way you use system-provided
    /// values, setting a value with the ``View/environment(_:_:)`` view
    /// modifier, and reading values with the ``Environment`` property wrapper.
    /// You can also provide a dedicated view modifier as a convenience for
    /// setting the value:
    ///
    ///     extension View {
    ///         func myCustomValue(_ myCustomValue: String) -> some View {
    ///             environment(\.myCustomValue, myCustomValue)
    ///         }
    ///     }
    ///
    public subscript<K>(key: K.Type) -> K.Value where K : EnvironmentKey {
        get { _plist[ObjectIdentifier(key)] == nil ? K.defaultValue : _plist[ObjectIdentifier(key)] as! K.Value }
        set { _plist[ObjectIdentifier(key)] = newValue }
    }

    // MARK: - Custom String Convertible

    /// A string that represents the contents of the environment values
    /// instance.
    public var description: String { _plist.map { "\($0): \($1)" }.joined(separator: "\n") }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension ScenePhase : EnvironmentKey {
    public static var defaultValue: ScenePhase {
        .background
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Prominence : EnvironmentKey {
    public static var defaultValue: Prominence {
        .standard
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct IsEnable : EnvironmentKey {
    static var defaultValue: Bool {
        true
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct IsFocused : EnvironmentKey {
    static var defaultValue: Bool {
        false
    }
}

extension ColorScheme : EnvironmentKey {
    public static var defaultValue: ColorScheme {
        .light
    }
}

extension ColorSchemeContrast : EnvironmentKey {
    public static var defaultValue: ColorSchemeContrast {
        .standard
    }
}

extension EnvironmentValues {
    /// The current phase of the scene.
    ///
    /// The system sets this value to provide an indication of the
    /// operational state of a scene or collection of scenes. The exact
    /// meaning depends on where you access the value. For more information,
    /// see ``ScenePhase``.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    var scenePhase: ScenePhase {
        get { self[ScenePhase.self] }
        set { self[ScenePhase.self] = newValue }
    }

    // The prominence to apply to section headers within a view.
    ///
    /// The default is ``Prominence/standard``.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    var headerProminence: Prominence {
        get { self[Prominence.self] }
        set { self[Prominence.self] = newValue }
    }

    /// A Boolean value that indicates whether the view associated with this
    /// environment allows user interaction.
    ///
    /// The default value is `true`.
    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public var isEnabled: Bool {
        get { self[IsEnable.self] }
        get { self[IsEnable.self] = newValue }
    }

    /// Returns whether the nearest focusable ancestor has focus.
    ///
    /// If there is no focusable ancestor, the value is `false`.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    public var isFocused: Bool {
        get { self[IsFocused.self] }
        set { self[IsFocused.self] = newValue }
    }

    /// The color scheme of this environment.
    ///
    /// Read this environment value from within a view to find out if OpenSwiftUI
    /// is currently displaying the view using the ``ColorScheme/light`` or
    /// ``ColorScheme/dark`` appearance. The value that you receive depends on
    /// whether the user has enabled Dark Mode, possibly superseded by
    /// the configuration of the current presentation's view hierarchy.
    ///
    ///     @Environment(\.colorScheme) private var colorScheme
    ///
    ///     var body: some View {
    ///         Text(colorScheme == .dark ? "Dark" : "Light")
    ///     }
    ///
    /// You can set the `colorScheme` environment value directly,
    /// but that usually isn't what you want. Doing so changes the color
    /// scheme of the given view and its child views but *not* the views
    /// above it in the view hierarchy. Instead, set a color scheme using the
    /// ``View/preferredColorScheme(_:)`` modifier, which also propagates the
    /// value up through the view hierarchy to the enclosing presentation, like
    /// a sheet or a window.
    ///
    /// When adjusting your app's user interface to match the color scheme,
    /// consider also checking the ``EnvironmentValues/colorSchemeContrast``
    /// property, which reflects a system-wide contrast setting that the user
    /// controls. For information about using color and contrast in your app,
    /// see [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast/).
    ///
    /// > Note: If you only need to provide different colors or
    /// images for different color scheme and contrast settings, do that in
    /// your app's Asset Catalog. See
    /// <doc://com.apple.documentation/documentation/Xcode/Asset-Management>.
    public var colorScheme: ColorScheme {
        get { self[ColorScheme.self] }
        set { self[ColorScheme.self] = newValue }
    }

    /// The contrast associated with the color scheme of this environment.
    ///
    /// Read this environment value from within a view to find out if OpenSwiftUI
    /// is currently displaying the view using ``ColorSchemeContrast/standard``
    /// or ``ColorSchemeContrast/increased`` contrast. The value that you read
    /// depends entirely on user settings, and you can't change it.
    ///
    ///     @Environment(\.colorSchemeContrast) private var colorSchemeContrast
    ///
    ///     var body: some View {
    ///         Text(colorSchemeContrast == .standard ? "Standard" : "Increased")
    ///     }
    ///
    /// When adjusting your app's user interface to match the contrast,
    /// consider also checking the ``EnvironmentValues/colorScheme`` property
    /// to find out if OpenSwiftUI is displaying the view with a light or dark
    /// appearance. For information about using color and contrast in your app,
    /// see [Color and Contrast](https://developer.apple.com/design/human-interface-guidelines/accessibility/overview/color-and-contrast/).
    ///
    /// > Note: If you only need to provide different colors or
    /// images for different color scheme and contrast settings, do that in
    /// your app's Asset Catalog. See
    /// <doc://com.apple.documentation/documentation/Xcode/Asset-Management>.
    public var colorSchemeContrast: ColorSchemeContrast {
        get { self[ColorSchemeContrast.self] }
        set { self[ColorSchemeContrast.self] = newValue }
    }
}
