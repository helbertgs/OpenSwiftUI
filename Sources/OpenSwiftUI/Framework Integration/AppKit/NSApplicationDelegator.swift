import AppKit
import OpenCombine

@MainActor 
@preconcurrency
@propertyWrapper
public struct NSApplicationDelegateAdaptor<DelegateType> where DelegateType: NSObject, DelegateType: NSApplicationDelegate {

    public var wrappedValue: DelegateType

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
        print("\(Self.self).\(#function)")
        self.wrappedValue = delegateType.init()
        NSApplication.shared.delegate = wrappedValue
    }
}

extension NSApplicationDelegateAdaptor where DelegateType : ObservableObject {

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
        .init(value: wrappedValue)
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
        print("\(Self.self).\(#function)")
        self.wrappedValue = delegateType.init()
        NSApplication.shared.delegate = wrappedValue
    }
}