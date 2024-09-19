import Foundation

/// Position and direction information of a zoom gesture that someone performs with an assistive technology like VoiceOver
public struct AccessibilityZoomGestureAction {

  @frozen public enum Direction: Equatable, Hashable, Sendable {
    case zoomIn
    case zoomOut
  }

  // MARK: - Getting the action’s direction

  /// The zoom gesture’s direction.
  public let direction: Direction

  // MARK: - Getting location information

  /// The zoom gesture’s activation point, normalized to the accessibility element’s frame.
  public let location: UnitPoint

  /// The zoom gesture’s activation point within the window’s coordinate space.
  public let point: Point

  /// Create a new AccessibilityZoomGestureAction
  /// - Parameters:
  ///   - direction: The zoom gesture’s direction.
  ///   - location: The zoom gesture’s activation point, normalized to the accessibility element’s frame.
  ///   - point: The zoom gesture’s activation point within the window’s coordinate space.
  public init(direction: Direction, location: UnitPoint, point: Point) {
    self.direction = direction
    self.location = location
    self.point = point
  }
}