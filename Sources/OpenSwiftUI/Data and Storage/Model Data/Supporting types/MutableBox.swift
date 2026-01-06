import Foundation

public class MutableBox<Value> {
    public var value: Value

    public init(value: Value) {
        self.value = value
    }
}