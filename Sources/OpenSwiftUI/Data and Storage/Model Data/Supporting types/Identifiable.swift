import Foundation

public protocol Identifiable {
    associatedtype ID

    var id: Self.ID { get set }
}