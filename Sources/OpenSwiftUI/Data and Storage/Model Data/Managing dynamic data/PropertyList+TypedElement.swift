import Foundation

extension PropertyList {

    /// A concrete node that associates a `PropertyListKey` subtype `K` with its value.
    final class TypedElement<K: PropertyListKey>: Element, @unchecked Sendable {
        var value: K.Value

        init(value: K.Value, next: Element?) {
            self.value = value
            super.init()
            self.next = next
        }

        override var description: String { "\(K.self) = \(value)" }
    }
}
