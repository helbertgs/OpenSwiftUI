import Foundation
import OpenSpatial

public typealias _SceneOutputs = _SceneData
public typealias _SceneInputs = _SceneData

/// The outputs of a scene.
@MainActor @preconcurrency 
public struct _SceneData {

    // MARK: - Checking characteristics

    /// The identifier of the scene.
    var id: String = UUID().uuidString

    /// The type of the scene.
    var type: String = ""

    var title: String = ""

    /// The scene that this output represents.
    var scene: (any Scene)? = nil

    // MARK: - Creating background tasks

    /// The background tasks for the scene.
    var backgroundTasks: [Task<Void, Never>] = []

    // MARK: - Managing app storage

    /// The app storage for the scene.
    var appStorage: UserDefaults = .standard

    // MARK: - Setting commands

    // MARK: - Sizing and positioning the scene

    /// The position of the scene.
    var position: Point3D = .zero

    /// The size of the scene.
    var size: Size3D = .init(width: 900, height: 450)

    /// The ideal size of the scene.
    var idealSize: Size3D = .zero

    /// The placement of the scene.
    var placement: WindowPlacement = .init()

    /// The resizability of the scene.
    var resizability: WindowResizability = .contentSize

    /// The manage role of the scene.
    var manageRole: WindowManagerRole = .automatic

    // MARK: - Configuring scene visibility

    /// The launch behavior of the scene.
    var launchBehavior: SceneLaunchBehavior = .automatic

    /// The restoration behavior of the scene.
    var restorationBehavior: SceneRestorationBehavior = .automatic

    // MARK: - Styling the scene

    /// The style of the scene.
    var style: any WindowStyle = DefaultWindowStyle()

    /// The toolbar style of the scene.
    var toolbarStyle: any WindowToolbarStyle = .automatic

    // MARK: - Managing the environment

    /// The environment values for the scene.
    var environmentValues: EnvironmentValues = .init()

    // MARK: - Interacting with dialogs

    /// The icon of the dialog.
    var dialogIcon: Any? = nil

    /// The severity of the dialog.
    var dialogSeverity: DialogSeverity = .automatic

    // MARK: - Managing Hierarchical Relationships

    /// The children of the scene.
    var children: [_SceneOutputs] = []

    // var content: (any View)?  = nil
}

// DisplaysKey = [SwiftUI.DisplayProxy(bounds: (0.0, 0.0, 3840.0, 2160.0), safeAreaInsets: SwiftUI.EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), visibleRect: (0.0, 25.0, 3840.0, 2135.0)), SwiftUI.DisplayProxy(bounds: (0.0, 0.0, 1080.0, 1920.0), safeAreaInsets: SwiftUI.EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), visibleRect: (0.0, 25.0, 1080.0, 1895.0))]
// FocusedDisplayKey  = Optional(SwiftUI.DisplayProxy(bounds: (0.0, 0.0, 3840.0, 2160.0), safeAreaInsets: SwiftUI.EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0), visibleRect: (0.0, 25.0, 3840.0, 2135.0)))
// SceneKeyboardShortcutsKey = [:]
// HasSystemOpenURLActionKey =  = true
// ResolvedTextProviderKey> = Optional(SwiftUI.SwiftUIResolvedTextProvider
// SystemAccentValueProviderKey = Optional(SwiftUI.MacSystemAccentValueProvider)
// FallbackFontProviderKey = SwiftUIFallbackFontProvider()
// CoreUINamedColorProviderKey> = Optional(SwiftUI.KitCoreUINamedColorProvider
// DefaultAccentColorProviderKey = Optional(SwiftUI.SwiftUIDefaultAccentColorProvider)
// ScenePhaseKey = active
// TimeZoneKey = America/Toronto
// <CalendarKey> = gregorian (gregorian) locale: en_CA time zone: America/Toronto firstWeekday: 1 minDaysInFirstWeek: 1
// LocaleKey> = en_CA (fixed en_CA)
// HostingViewHasRootDelegateKey> = false
// DisplayIDKey> = Optional(3)
// AccessibilityRequestFocusKey> = AccessibilityRequestFocusAction(onAccessibilityFocus: nil)
// FocusSystemKey> = _FocusSystem(onResetToDefault: Optional((Function)))
// ResetFocusKey> = _ResetFocusAction(bridge: Optional(SwiftUI.FocusBridge))
// FocusBridgeKey> = WeakBox<FocusBridge>(base: Optional(SwiftUI.FocusBridge))
// EnvironmentObjectKey<PrimaryBarViewModel>> = Optional(SwiftUI.PrimaryBarViewModel)
// DockTileInvalidatorKey> = Optional(SwiftUI.WeakBox<SwiftUI.WindowDockTileInvalidator>(base: Optional(SwiftUI.WindowDockTileInvalidator)))
// OpenWindowActionKey> = OpenWindowAction(windowNumber: Optional(62648))
// DismissWindowActionKey> = DismissWindowAction(presentationMode: Optional(SwiftUI.Binding<SwiftUI.PresentationMode>(transaction: SwiftUI.Transaction(plist: []), location: SwiftUI.LocationBox<SwiftUI.AppKitPresentationModeLocation<SwiftUI.ModifiedContent<SwiftUI.AnyView, SwiftUI.RootModifier>>>, _value: SwiftUI.PresentationMode(isPresented: true))))
// PresentationModeKey> = Binding<PresentationMode>(transaction: SwiftUI.Transaction(plist: []), location: SwiftUI.LocationBox<SwiftUI.AppKitPresentationModeLocation<SwiftUI.ModifiedContent<SwiftUI.AnyView, SwiftUI.RootModifier>>>, _value: SwiftUI.PresentationMode(isPresented: true))
// Key> = BackgroundProminence(guts: SwiftUI.BackgroundProminence.Guts.standard)
// PreferenceBridgeKey> = Value(value: nil)

// Global Environment Values
// Printing description of $R33:
// <GlobalEnvironment: 0x6000024577b0>
// Printing description of $R34:
// EnvironmentPropertyKey<AccessibilityReduceHoverRevealKey> = false
// Printing description of $R35:
// EnvironmentPropertyKey<AccessibilityOnOffLabelsKey> = false
// Printing description of $R36:
// EnvironmentPropertyKey<AccessibilityQuickActionsKey> = false
// Printing description of $R37:
// EnvironmentPropertyKey<AccessibilityLargeContentViewerKey> = false
// Printing description of $R38:
// EnvironmentPropertyKey<EnabledTechnologiesKey> = AccessibilityTechnologies(technologySet: SwiftUI.(unknown context at $1ca57a500).AccessibilityTechnologySet(rawValue: 0))
// Printing description of $R39:
// EnvironmentPropertyKey<AccessibilityPlayAnimatedImagesKey> = true
// Printing description of $R40:
// EnvironmentPropertyKey<AccessibilityDimFlashingLightsKey> = false
// Printing description of $R41:
// EnvironmentPropertyKey<AccessibilityButtonShapesKey> = false
// Printing description of $R42:
// EnvironmentPropertyKey<AccessibilityPrefersCrossFadeTransitionsKey> = false
// Printing description of $R43:
// EnvironmentPropertyKey<AccessibilityInvertColorsKey> = false
// Printing description of $R44:
// EnvironmentPropertyKey<AccessibilityReduceMotionKey> = false
// Printing description of $R45:
// EnvironmentPropertyKey<AccessibilityReduceTransparencyKey> = false
// Printing description of $R46:
// EnvironmentPropertyKey<AccessibilityDifferentiateWithoutColorKey> = false


// _ConditionalContent<ModifiedContent<ModifiedContent<ModifiedContent<AnyView, _SafeAreaRegionsIgnoringLayout>, AddGestureModifier<WindowDragGesture>>, AllowsWindowActivationEventsModifier>, Optional<ModifiedContent<AnyView, _SafeAreaRegionsIgnoringLayout>>>.Storage