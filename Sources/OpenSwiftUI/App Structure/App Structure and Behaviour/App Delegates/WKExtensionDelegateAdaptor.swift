import OpenCombine
import Swift
import WatchKit

/// A property wrapper type that you use to create a WatchKit app delegate.
@propertyWrapper public struct WKExtensionDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : WKExtensionDelegate {

    // MARK: - Property(ies).

    /// The underlying app delegate.
    public var wrappedValue: DelegateType

    // MARK: - Constructor(s).

    /// Creates a WatchKit app delegate adaptor.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the WKExtensionDelegate protocol.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

extension UIApplicationDelegateAdaptor where DelegateType : OpenCombine.ObservableObject {
    /// A projection of the observed object that provides bindings to its properties.
    public var projectedValue: ObservedObject<DelegateType>.Wrapper {
        .init(wrappedValue)
    }

    /// Creates a WatchKit app delegate adaptor using a delegate that’s an observable object.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the WKExtensionDelegate and ObservableObject protocols.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}
