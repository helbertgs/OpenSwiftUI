#if canImport(UIKit)

import OpenCombine
import Swift
import UIKit

/// A property wrapper type that you use to create a AppKit app delegate.
@propertyWrapper public struct UIApplicationDelegateAdaptor<DelegateType> where DelegateType : NSObject, DelegateType : UIApplicationDelegate {

    // MARK: - Property(ies).

    /// The underlying app delegate.
    public var wrappedValue: DelegateType

    // MARK: - Constructor(s).

    /// Creates a UIKit app delegate adaptor.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the UIApplicationDelegate protocol.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

extension UIApplicationDelegateAdaptor where DelegateType : OpenCombine.ObservableObject {
    /// A projection of the observed object that provides bindings to its properties.
    public var projectedValue: ObservedObject<DelegateType>.Wrapper {
        .init(wrappedValue: wrappedValue)
    }

    /// Creates a UIKit app delegate adaptor using a delegate that’s an observable object.
    /// - Parameter delegateType: The type of application delegate that you define in your app, which conforms to the UIApplicationDelegate and ObservableObject protocols.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) {
        self.wrappedValue = delegateType.init()
    }
}

#endif
