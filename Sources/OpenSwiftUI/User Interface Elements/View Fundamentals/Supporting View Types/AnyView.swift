import Swift

@frozen public struct AnyView: View {

    // MARK: - Type Alias.

    public typealias Body = Never

    // MARK: - Public Property(ies).

    public var body: Never { fatalError() }

    // MARK: - Internal Property(ies).

    var storage: AnyViewStorageBase

    // MARK: - Constructor(s).

    public init<V>(_ view: V) where V: View {
        storage = AnyViewStorage(view)
    }

    public init?(_fromValue value: Any) {
        storage = AnyViewStorage(value)
    }

    public init<T: View>(erasing: T) {
        storage = AnyViewStorage(erasing)
    }

    // MARK: - Static Function(s).

    public static func makeView(view: _GraphValue<AnyView>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError()
    }

    // MARK: - Internal Structure(s).

    @usableFromInline
    class AnyViewStorageBase { }

    @usableFromInline
    class AnyViewStorage<V>: AnyViewStorageBase {

        // MARK: - Property(ies).
        @usableFromInline
        var _view: V

        // MARK: - Constructor(s).
        @usableFromInline
        init(_ view: V) {
            self._view = view
        }
    }
}
