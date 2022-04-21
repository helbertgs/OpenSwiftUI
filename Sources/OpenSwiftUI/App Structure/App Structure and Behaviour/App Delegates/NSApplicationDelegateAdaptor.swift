#if canImport(AppKit)

import OpenCombine
import Swift
import AppKit

/// A property wrapper type that you use to create a AppKit app delegate.
@propertyWrapper public struct NSApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : NSApplicationDelegate {

    // MARK: - Property(ies).

    /// The underlying app delegate.
    public var wrappedValue: DelegateType

    // MARK: - Constructor(s).

    /// Creates a AppKit app delegate adaptor.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the NSApplicationDelegateAdaptor protocol.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

extension UIApplicationDelegateAdaptor where DelegateType : OpenCombine.ObservableObject {
    /// A projection of the observed object that provides bindings to its properties.
    public var projectedValue: ObservedObject<DelegateType>.Wrapper {
        .init(wrappedValue: wrappedValue)
    }

    /// Creates a AppKit app delegate adaptor using a delegate that’s an observable object.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the NSApplicationDelegateAdaptor and ObservableObject protocols.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

#endif
