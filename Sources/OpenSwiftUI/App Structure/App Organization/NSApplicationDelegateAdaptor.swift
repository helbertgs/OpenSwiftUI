#if os(iOS) || os(macOS)
import Combine
#else
import OpenCombine
#endif

#if canImport(AppKit)

import Swift
import AppKit

/// A property wrapper type that you use to create an AppKit app delegate.
///
/// To handle app delegate callbacks in an app that uses the
/// OpenSwiftUI life cycle, define a type that conforms to the
/// <doc://com.apple.documentation/documentation/AppKit/NSApplicationDelegate>
/// protocol, and implement the delegate methods that you need. For example,
/// you can implement the
/// <doc://com.apple.documentation/documentation/AppKit/NSApplicationDelegate/1428766-application>
/// method to handle remote notification registration:
///
///     class MyAppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
///         func application(
///             _ application: NSApplication,
///             didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
///         ) {
///             // Record the device token.
///         }
///     }
///
/// Then use the `NSApplicationDelegateAdaptor` property wrapper inside your
/// ``App`` declaration to tell OpenSwiftUI about the delegate type:
///
///     @main
///     struct MyApp: App {
///         @NSApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
///
///         var body: some Scene { ... }
///     }
///
/// OpenSwiftUI instantiates the delegate and calls the delegate's
/// methods in response to life cycle events. Define the delegate adaptor
/// only in your ``App`` declaration, and only once for a given app. If
/// you declare it more than once, OpenSwiftUI generates a runtime error.
///
/// If your app delegate conforms to the
/// <doc://com.apple.documentation/documentation/Combine/ObservableObject>
/// protocol, as in the example above, then OpenSwiftUI puts the delegate it
/// creates into the ``Environment``. You can access the delegate from
/// any scene or view in your app using the ``EnvironmentObject`` property
/// wrapper:
///
///     @EnvironmentObject private var appDelegate: MyAppDelegate
///
/// This enables you to use the dollar sign (`$`) prefix to get a binding to
/// published properties that you declare in the delegate. For more information,
/// see ``projectedValue``.
///
/// > Important: Manage an app's life cycle events without using an app
/// delegate whenever possible. For example, prefer to handle changes
/// in ``ScenePhase`` instead of relying on delegate callbacks, like
/// <doc://com.apple.documentation/documentation/AppKit/NSApplicationDelegate/1428385-applicationdidfinishlaunching>.
@propertyWrapper public struct NSApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : NSApplicationDelegate {

    // MARK: - Property(ies).

    /// The underlying app delegate.
    public var wrappedValue: DelegateType

    // MARK: - Constructor(s).
    /// Creates an AppKit app delegate adaptor.
    ///
    /// Call this initializer indirectly by creating a property with the
    /// ``NSApplicationDelegateAdaptor`` property wrapper from inside your
    /// ``App`` declaration:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         @NSApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    ///
    ///         var body: some Scene { ... }
    ///     }
    ///
    /// OpenSwiftUI initializes the delegate and manages its lifetime, calling upon
    /// it to handle application delegate callbacks.
    ///
    /// If you want OpenSwiftUI to put the instantiated delegate in the
    /// ``Environment``, make sure the delegate class also conforms to the
    /// <doc://com.apple.documentation/documentation/Combine/ObservableObject>
    /// protocol. That causes OpenSwiftUI to invoke the ``init(_:)-1dott``
    /// initializer rather than this one.
    ///
    /// - Parameter delegateType: The type of application delegate that you
    ///   define in your app, which conforms to the
    ///   <doc://com.apple.documentation/documentation/AppKit/NSApplicationDelegate>
    ///   protocol.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(Windows, unavailable)
extension NSApplicationDelegateAdaptor where DelegateType : ObservableObject {

    /// A projection of the observed object that provides bindings to its
    /// properties.
    ///
    /// Use the projected value to get a binding to a value that the delegate
    /// publishes. Access the projected value by prefixing the name of the
    /// delegate instance with a dollar sign (`$`). For example, you might
    /// publish a Boolean value in your application delegate:
    ///
    ///     class MyAppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    ///         @Published var isEnabled = false
    ///
    ///         // ...
    ///     }
    ///
    /// If you declare the delegate in your ``App`` using the
    /// ``NSApplicationDelegateAdaptor`` property wrapper, you can get
    /// the delegate that OpenSwiftUI instantiates from the environment and
    /// access a binding to its published values from any view in your app:
    ///
    ///     struct MyView: View {
    ///         @EnvironmentObject private var appDelegate: MyAppDelegate
    ///
    ///         var body: some View {
    ///             Toggle("Enabled", isOn: $appDelegate.isEnabled)
    ///         }
    ///     }
    ///
    public var projectedValue: ObservedObject<DelegateType>.Wrapper {
        .init(wrappedValue: wrappedValue)
    }

    /// Creates an AppKit app delegate adaptor using a delegate that's
    /// an observable object.
    ///
    /// Call this initializer indirectly by creating a property with the
    /// ``NSApplicationDelegateAdaptor`` property wrapper from inside your
    /// ``App`` declaration:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         @NSApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    ///
    ///         var body: some Scene { ... }
    ///     }
    ///
    /// OpenSwiftUI initializes the delegate and manages its lifetime, calling it
    /// as needed to handle application delegate callbacks.
    ///
    /// OpenSwiftUI invokes this method when your app delegate conforms to the
    /// <doc://com.apple.documentation/documentation/Combine/ObservableObject>
    /// protocol. In this case, OpenSwiftUI automatically places the delegate in the
    /// ``Environment``. You can access such a delegate from any scene or
    /// view in your app using the ``EnvironmentObject`` property wrapper:
    ///
    ///     @EnvironmentObject private var appDelegate: MyAppDelegate
    ///
    /// If your delegate isn't an observable object, OpenSwiftUI invokes the
    /// ``init(_:)-67u91`` initializer rather than this one, and doesn't
    /// put the delegate instance in the environment.
    ///
    /// - Parameter delegateType: The type of application delegate that you
    ///   define in your app, which conforms to the
    ///   <doc://com.apple.documentation/documentation/AppKit/NSApplicationDelegate>
    ///   and
    ///   <doc://com.apple.documentation/documentation/Combine/ObservableObject>
    ///   protocols.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

#endif
