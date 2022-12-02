#if os(iOS) || os(macOS)
import Combine
#else
import OpenCombine
#endif

#if canImport(UIKit)

import Swift
import UIKit

/// A property wrapper type that you use to create a UIKit app delegate.
///
/// To handle app delegate callbacks in an app that uses the
/// OpenSwiftUI life cycle, define a type that conforms to the
/// <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate>
/// protocol, and implement the delegate methods that you need. For example,
/// you can implement the
/// <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate/1622958-application>
/// method to handle remote notification registration:
///
///     class MyAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
///         func application(
///             _ application: UIApplication,
///             didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
///         ) {
///             // Record the device token.
///         }
///     }
///
/// Then use the `UIApplicationDelegateAdaptor` property wrapper inside your
/// ``App`` declaration to tell OpenSwiftUI about the delegate type:
///
///     @main
///     struct MyApp: App {
///         @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
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
/// <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate/1622921-application>.
///
/// ### Scene Delegates
///
/// Some iOS apps define a
/// <doc://com.apple.documentation/documentation/UIKit/UIWindowSceneDelegate>
/// to handle scene-based events, like app shortcuts:
///
///     class MySceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
///         func windowScene(
///             _ windowScene: UIWindowScene,
///             performActionFor shortcutItem: UIApplicationShortcutItem
///         ) async -> Bool {
///             // Do something with the shortcut...
///
///             return true
///         }
///     }
///
/// You can provide this kind of delegate to a OpenSwiftUI app by returning the
/// scene delegate's type from the
/// <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate/3197905-application>
/// method inside your app delegate:
///
///     extension MyAppDelegate {
///         func application(
///             _ application: UIApplication,
///             configurationForConnecting connectingSceneSession: UISceneSession,
///             options: UIScene.ConnectionOptions
///         ) -> UISceneConfiguration {
///
///             let configuration = UISceneConfiguration(
///                                     name: nil,
///                                     sessionRole: connectingSceneSession.role)
///             if connectingSceneSession.role == .windowApplication {
///                 configuration.delegateClass = MySceneDelegate.self
///             }
///             return configuration
///         }
///     }
///
/// When you configure the
/// <doc://com.apple.documentation/documentation/UIKit/UISceneConfiguration>
/// instance, you only need to indicate the delegate class, and not a scene
/// class or storyboard. OpenSwiftUI creates and manages the delegate instance,
/// and sends it any relevant delegate callbacks.
///
/// As with the app delegate, if you make your scene delegate an observable
/// object, OpenSwiftUI automatically puts it in the ``Environment``, from where
/// you can access it with the ``EnvironmentObject`` property wrapper, and
/// create bindings to its published properties.
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(Windows, unavailable)
@propertyWrapper public struct UIApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : UIApplicationDelegate {

    // MARK: - Property(ies).

    /// The underlying app delegate.
    public var wrappedValue: DelegateType {
        get {
            guard
                let adapter = UIApplication.shared.delegate as? UIApplicationDelegateAdapter,
                let wrapper = adapter.wrapper as? DelegateType else {
                    fatalError()
            }

            return wrapper
        }

        set { (UIApplication.shared.delegate as? UIApplicationDelegateAdapter)?.wrapper = newValue }
    }

    // MARK: - Constructor(s).

    /// Creates a UIKit app delegate adaptor.
    ///
    /// Call this initializer indirectly by creating a property with the
    /// ``UIApplicationDelegateAdaptor`` property wrapper from inside your
    /// ``App`` declaration:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
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
    /// protocol. That causes OpenSwiftUI to invoke the ``init(_:)-8vsx1``
    /// initializer rather than this one.
    ///
    /// - Parameter delegateType: The type of application delegate that you
    ///   define in your app, which conforms to the
    ///   <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate>
    ///   protocol.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(Windows, unavailable)
extension UIApplicationDelegateAdaptor where DelegateType : ObservableObject {

    /// A projection of the observed object that provides bindings to its
    /// properties.
    ///
    /// Use the projected value to get a binding to a value that the delegate
    /// publishes. Access the projected value by prefixing the name of the
    /// delegate instance with a dollar sign (`$`). For example, you might
    /// publish a Boolean value in your application delegate:
    ///
    ///     class MyAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    ///         @Published var isEnabled = false
    ///
    ///         // ...
    ///     }
    ///
    /// If you declare the delegate in your ``App`` using the
    /// ``UIApplicationDelegateAdaptor`` property wrapper, you can get
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

    /// Creates a UIKit app delegate adaptor using a delegate that's
    /// an observable object.
    ///
    /// Call this initializer indirectly by creating a property with the
    /// ``UIApplicationDelegateAdaptor`` property wrapper from inside your
    /// ``App`` declaration:
    ///
    ///     @main
    ///     struct MyApp: App {
    ///         @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
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
    /// ``init(_:)-59sfu`` initializer rather than this one, and doesn't
    /// put the delegate instance in the environment.
    ///
    /// - Parameter delegateType: The type of application delegate that you
    ///   define in your app, which conforms to the
    ///   <doc://com.apple.documentation/documentation/UIKit/UIApplicationDelegate>
    ///   and
    ///   <doc://com.apple.documentation/documentation/Combine/ObservableObject>
    ///   protocols.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

#endif
