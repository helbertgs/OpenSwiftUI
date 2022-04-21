import Swift

/// An interface for a stored variable that updates an external property of a
/// view.
///
/// The view gives values to these properties prior to recomputing the view's
/// ``View/body-swift.property``.
public protocol DynamicProperty {

    // MARK: - Property(ies).
    static var _propertyBehaviors: UInt32 { get }

    // MARK: - Function*s).
    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// value.
    mutating func update()

    // MARK: - Static Function*s).
    // static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs)
}

extension DynamicProperty {

    // MARK: - Property(ies).
    public static var _propertyBehaviors: UInt32 { 0 }

    // MARK: - Function*s).
    /// Updates the underlying value of the stored value.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// value.
    public mutating func update() { }

    // MARK: - Static Function*s).
    // public static func _makeProperty<V>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<V>, fieldOffset: Int, inputs: inout _GraphInputs) { }
}