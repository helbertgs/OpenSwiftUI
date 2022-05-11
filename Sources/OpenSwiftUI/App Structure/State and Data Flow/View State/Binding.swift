import Swift

/// A property wrapper type that can read and write a value owned by a source of
/// truth.
///
/// Use a binding to create a two-way connection between a property that stores
/// data, and a view that displays and changes the data. A binding connects a
/// property to a source of truth stored elsewhere, instead of storing data
/// directly. For example, a button that toggles between play and pause can
/// create a binding to a property of its parent view using the `Binding`
/// property wrapper.
///
///     struct PlayButton: View {
///         @Binding var isPlaying: Bool
///
///         var body: some View {
///             Button(isPlaying ? "Pause" : "Play") {
///                 isPlaying.toggle()
///             }
///         }
///     }
///
/// The parent view declares a property to hold the playing state, using the
/// ``State`` property wrapper to indicate that this property is the value's
/// source of truth.
///
///     struct PlayerView: View {
///         var episode: Episode
///         @State private var isPlaying: Bool = false
///
///         var body: some View {
///             VStack {
///                 Text(episode.title)
///                     .foregroundStyle(isPlaying ? .primary : .secondary)
///                 PlayButton(isPlaying: $isPlaying) // Pass a binding.
///             }
///         }
///     }
///
/// When `PlayerView` initializes `PlayButton`, it passes a binding of its state
/// property into the button's binding property. Applying the `$` prefix to a
/// property wrapped value returns its ``State/projectedValue``, which for a
/// state property wrapper returns a binding to the value.
///
/// Whenever the user taps the `PlayButton`, the `PlayerView` updates its
/// `isPlaying` state.
@frozen @propertyWrapper @dynamicMemberLookup public struct Binding<Value> : DynamicProperty {

    // MARK: - Private Property(ies).

    @usableFromInline var getter: () -> Value
    @usableFromInline var setter: (Value) -> Void

    // MARK: - Public Property(ies).

    /// The underlying value referenced by the binding variable.
    ///
    /// This property provides primary access to the value's data. However, you
    /// don't access `wrappedValue` directly. Instead, you use the property
    /// variable created with the ``Binding`` attribute. In the
    /// following code example, the binding variable `isPlaying` returns the
    /// value of `wrappedValue`:
    ///
    ///     struct PlayButton: View {
    ///         @Binding var isPlaying: Bool
    ///
    ///         var body: some View {
    ///             Button(isPlaying ? "Pause" : "Play") {
    ///                 isPlaying.toggle()
    ///             }
    ///         }
    ///     }
    ///
    /// When a mutable binding value changes, the new value is immediately
    /// available. However, updates to a view displaying the value happens
    /// asynchronously, so the view may not show the change immediately.
    public var wrappedValue : Value {
        get { getter() }
        set {
            setter(newValue)
            update()
        }
    }

    /// A projection of the binding value that returns a binding.
    ///
    /// Use the projected value to pass a binding value down a view hierarchy.
    /// To get the `projectedValue`, prefix the property variable with `$`. For
    /// example, in the following code example `PlayerView` projects a binding
    /// of the state property `isPlaying` to the `PlayButton` view using
    /// `$isPlaying`.
    ///
    ///     struct PlayerView: View {
    ///         var episode: Episode
    ///         @State private var isPlaying: Bool = false
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Text(episode.title)
    ///                     .foregroundStyle(isPlaying ? .primary : .secondary)
    ///                 PlayButton(isPlaying: $isPlaying)
    ///             }
    ///         }
    ///     }
    ///
    public var projectedValue: Binding<Value> {
        Binding(get: getter, set: setter)
    }

    // MARK: - Subscript(s).

    /// Returns a binding to the resulting value of a given key path.
    ///
    /// - Parameter keyPath: A key path to a specific resulting value.
    ///
    /// - Returns: A new binding.
    public subscript<Subject>(dynamicMember keyPath: WritableKeyPath<Value, Subject>) -> Binding<Subject> {
        get { Binding<Subject>.constant(wrappedValue[keyPath: keyPath]) }
        set { wrappedValue[keyPath: keyPath] = newValue.wrappedValue }
    }

    // MARK: - Constructor(s).

    /// Creates a binding from the value of another binding.
    public init(projectedValue: Binding<Value>) {
        self = projectedValue
    }

    /// Creates a binding by projecting the base value to an unwrapped value.
    ///
    /// - Parameter base: A value to project to an unwrapped value.
    ///
    /// - Returns: A new binding or `nil` when `base` is `nil`.
    public init?(_ base: Binding<Value?>) {
        guard let wrappedValue = base.wrappedValue else {
            return nil
        }

        getter = { wrappedValue }
        setter = base.setter
    }

    /// Creates a binding by projecting the base value to an optional value.
    ///
    /// - Parameter base: A value to project to an optional value.
    public init<V>(_ base: Binding<V>) where Value == V? {
        fatalError("")
    }

    /// Creates a binding by projecting the base value to a hashable value.
    ///
    /// - Parameters:
    ///   - base: A `Hashable` value to project to an `AnyHashable` value.
    public init<V>(_ base: Binding<V>) where Value == AnyHashable, V : Hashable {
        fatalError()
    }

    /// Creates a binding with closures that read and write the binding value.
    ///
    /// - Parameters:
    ///   - get: A closure that retrieves the binding value. The closure has no
    ///     parameters, and returns a value.
    ///   - set: A closure that sets the binding value. The closure has the
    ///     following parameter:
    ///       - newValue: The new value of the binding value.
    public init(get: @escaping () -> Value, set: @escaping (Value) -> Void) {
        self.getter = get
        self.setter = set
    }

    // MARK: - Static Function(s).

    /// Creates a binding with an immutable value.
    ///
    /// Use this method to create a binding to a value that cannot change.
    /// This can be useful when using a ``PreviewProvider`` to see how a view
    /// represents different values.
    ///
    ///     // Example of binding to an immutable value.
    ///     PlayButton(isPlaying: Binding.constant(true))
    ///
    /// - Parameter value: An immutable value.
    public static func constant(_ value: Value) -> Binding<Value> {
        .init(
            get: { value },
            set: { _ in })
    }
}

extension Binding : Identifiable where Value : Identifiable {

    /// A type representing the stable identity of the entity associated with
    /// an instance.
    public typealias ID = Value.ID

    /// The stable identity of the entity associated with this instance,
    /// corresponding to the `id` of the binding's wrapped value.
    public var id: Value.ID {
        wrappedValue.id
    }
}

/*
extension Binding {

    /// Specifies a transaction for the binding.
    ///
    /// - Parameter transaction  : An instance of a ``Transaction``.
    ///
    /// - Returns: A new binding.
    public func transaction(_ transaction: Transaction) -> Binding<Value>

    /// Specifies an animation to perform when the binding value changes.
    ///
    /// - Parameter animation: An animation sequence performed when the binding
    ///   value changes.
    ///
    /// - Returns: A new binding.
    public func animation(_ animation: Animation? = .default) -> Binding<Value>
}
*/
