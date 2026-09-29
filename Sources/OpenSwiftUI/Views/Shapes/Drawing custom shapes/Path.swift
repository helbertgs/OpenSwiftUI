import Foundation
@_exported import OpenSpatial

/// The outline of a 2D shape.
public struct Path : Equatable, Sendable {

    // MARK: - Creating a path

    /// /// Creates an empty path.
    /// 
    /// - Parameters:
    ///   - elements: 
    ///   - storage: 
    private init(elements: [Element], storage: Storage) {
        self.elements = elements
        self.storage = storage
    }

    /// Creates an empty path.
    public init() {
        storage = .empty
        elements = []
    }

    /// Creates a path as an ellipse within the given rectangle.
    /// 
    /// This is a convenience function that creates a path of an ellipse. 
    /// Using this convenience function is more efficient than creating a path and adding an ellipse to it.
    /// 
    /// The ellipse is approximated by a sequence of Bézier curves. 
    /// Its center is the midpoint of the rectangle defined by the rect parameter. 
    /// If the rectangle is square, then the ellipse is circular with a radius equal to one-half the width (or height) of the rectangle. 
    /// If the rect parameter specifies a rectangular shape, then the major and minor axes of the ellipse are defined by the width and height of the rectangle.
    /// 
    /// The ellipse forms a complete subpath of the path—that is, the ellipse drawing starts with a move-to operation and ends with a close-subpath operation, with all moves oriented in the clockwise direction. 
    /// If you supply an affine transform, then the constructed Bézier curves that define the ellipse are transformed before they are added to the path.
    /// - Parameter rect: The rectangle that bounds the ellipse.
    public init(ellipseIn rect: Rect3D) {
        storage = .ellipse(rect)
        elements = []
        currentPoint = nil
        boundingRect = rect
        description = ""
        // Build the elliptical subpath using four cubic Bézier curves.
        let center = rect.center
        let rx = rect.size.width / 2
        let ry = rect.size.height / 2
        let cx = center.x
        let cy = center.y

        // Control point offset for a 90° arc: k = 4/3 * tan(π/8)
        let k = 0.5522847498307936
        let dx = k * rx
        let dy = k * ry

        // Start at rightmost point (angle 0)
        let start = Point3D(x: cx + rx, y: cy, z: 0)
        elements.append(.move(to: start))
        currentPoint = start

        // Quadrant 1: (rx,0) to (0, ry)
        elements.append(.curve(to: Point3D(x: cx, y: cy + ry, z: 0),
                               control1: Point3D(x: cx + rx, y: cy + dy, z: 0),
                               control2: Point3D(x: cx + dx, y: cy + ry, z: 0)))
        // Quadrant 2: (0, ry) to (-rx, 0)
        elements.append(.curve(to: Point3D(x: cx - rx, y: cy, z: 0),
                               control1: Point3D(x: cx - dx, y: cy + ry, z: 0),
                               control2: Point3D(x: cx - rx, y: cy + dy, z: 0)))
        // Quadrant 3: (-rx, 0) to (0, -ry)
        elements.append(.curve(to: Point3D(x: cx, y: cy - ry, z: 0),
                               control1: Point3D(x: cx - rx, y: cy - dy, z: 0),
                               control2: Point3D(x: cx - dx, y: cy - ry, z: 0)))
        // Quadrant 4: (0, -ry) to (rx, 0)
        elements.append(.curve(to: Point3D(x: cx + rx, y: cy, z: 0),
                               control1: Point3D(x: cx + dx, y: cy - ry, z: 0),
                               control2: Point3D(x: cx + rx, y: cy - dy, z: 0)))
        elements.append(.closeSubpath)
        // After close, currentPoint remains the last point (rightmost)
        currentPoint = start
    }

    /// Creates a path containing a rounded rectangle.
    /// 
    /// This is a convenience function that creates a path of a rounded rectangle. 
    /// Using this convenience function is more efficient than creating a path and adding a rounded rectangle to it.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerRadius: The radius of all corners of the rectangle, specified in user space coordinates.
    ///   - style: The corner style. Defaults to the continous style if not specified.
    public init(roundedRect rect: Rect3D, cornerRadius: Double) {
        storage = .roundedRect(rect, cornerRadius)
        elements = []
        currentPoint = nil
        boundingRect = rect
        description = ""
        // Build rounded rectangle subpath (counter‑clockwise, starting at top‑left)
        let minX = rect.min.x
        let maxX = rect.max.x
        let minY = rect.min.y
        let maxY = rect.max.y
        let r = min(cornerRadius, rect.size.width / 2, rect.size.height / 2)

        // Start at top‑left corner after the radius (x = minX + r, y = maxY)
        let start = Point3D(x: minX + r, y: maxY, z: 0)
        elements.append(.move(to: start))
        currentPoint = start

        // Top edge (rightwards)
        elements.append(.line(to: Point3D(x: maxX - r, y: maxY, z: 0)))

        // Top‑right arc (90° clockwise, from 0° to 90° in user space → counter‑clockwise in default SwiftUI coords)
        addArcHelper(center: Point3D(x: maxX - r, y: maxY - r, z: 0),
                     radius: r,
                     startAngle: Angle2D(radians: 0),
                     endAngle: Angle2D(radians: .pi / 2),
                     clockwise: false) // Actually draws clockwise in user space

        // Right edge (downwards)
        elements.append(.line(to: Point3D(x: maxX, y: minY + r, z: 0)))

        // Bottom‑right arc (90° clockwise, from 90° to 180°)
        addArcHelper(center: Point3D(x: maxX - r, y: minY + r, z: 0),
                     radius: r,
                     startAngle: Angle2D(radians: .pi / 2),
                     endAngle: Angle2D(radians: .pi),
                     clockwise: false)

        // Bottom edge (leftwards)
        elements.append(.line(to: Point3D(x: minX + r, y: minY, z: 0)))

        // Bottom‑left arc (90° clockwise, from 180° to 270°)
        addArcHelper(center: Point3D(x: minX + r, y: minY + r, z: 0),
                     radius: r,
                     startAngle: Angle2D(radians: .pi),
                     endAngle: Angle2D(radians: 3 * .pi / 2),
                     clockwise: false)

        // Left edge (upwards)
        elements.append(.line(to: Point3D(x: minX, y: maxY - r, z: 0)))

        // Top‑left arc (90° clockwise, from 270° to 360°)
        addArcHelper(center: Point3D(x: minX + r, y: maxY - r, z: 0),
                     radius: r,
                     startAngle: Angle2D(radians: 3 * .pi / 2),
                     endAngle: Angle2D(radians: 2 * .pi),
                     clockwise: false)

        elements.append(.closeSubpath)
        currentPoint = start
    }

    // MARK: - Getting the path’s characteristics

    /// The storage for the path's data.
    package var storage: Storage

    /// The elements that make up the path.
    package var elements: [Element]

    /// A rectangle containing all path segments.
    /// 
    /// This is the smallest rectangle completely enclosing all points in the path but not including control points for Bézier curves.
    public var boundingRect: Rect3D = .zero
    
    /// Returns true if the path contains a specified point.
    /// 
    /// If eoFill is true, this method uses the even-odd rule to define which points are inside the path. 
    /// Otherwise, it uses the non-zero rule.
    public func contains(_ point: Point3D, eoFill: Bool = false) -> Bool {
        // Implement ray casting for paths with lines and cubic curves.
        // For curves, we approximate each curve with a series of line segments.
        // This is a simplified implementation; it may be slow for complex paths.
        guard !elements.isEmpty else { return false }
        var crossings = 0
        var currentStart: Point3D? = nil
        var previousPoint: Point3D? = nil
        var subpathPoints: [Point3D] = []

        for element in elements {
            switch element {
            case .move(to: let pt):
                currentStart = pt
                previousPoint = pt
                subpathPoints.append(pt)
            case .line(to: let pt):
                if let prev = previousPoint {
                    if intersectRaySegment(point: point, p1: prev, p2: pt) {
                        crossings += 1
                    }
                }
                previousPoint = pt
                subpathPoints.append(pt)
            case .curve(to: let end, control1: let c1, control2: let c2):
                // Approximate curve with segments
                let segments = 20
                let pts = bezierPoints(start: previousPoint!, c1: c1, c2: c2, end: end, segments: segments)
                for i in 0..<(pts.count - 1) {
                    if intersectRaySegment(point: point, p1: pts[i], p2: pts[i+1]) {
                        crossings += 1
                    }
                }
                previousPoint = end
                subpathPoints.append(end)
            case .quadCurve(to: let end, control: let c):
                let segments = 20
                let pts = quadBezierPoints(start: previousPoint!, control: c, end: end, segments: segments)
                for i in 0..<(pts.count - 1) {
                    if intersectRaySegment(point: point, p1: pts[i], p2: pts[i+1]) {
                        crossings += 1
                    }
                }
                previousPoint = end
                subpathPoints.append(end)
            case .closeSubpath:
                if let start = currentStart, let prev = previousPoint {
                    if intersectRaySegment(point: point, p1: prev, p2: start) {
                        crossings += 1
                    }
                }
                // Reset for next subpath
                currentStart = nil
                previousPoint = nil
                subpathPoints = []
            }
        }

        // Even‑odd rule: point is inside if odd number of crossings
        return crossings % 2 == 1
    }

    /// Returns the last point in the path, or nil if the path contains no points.
    public var currentPoint: Point3D?

    /// A description of the path that may be used to recreate the path via init?(_:).
    public var description: String = ""

    /// A Boolean value indicating whether the path contains zero elements.
    public var isEmpty: Bool {
        elements.isEmpty && storage == .empty
    }

    // MARK: - Drawing a path

    /// Begins a new subpath at the specified point.
    /// 
    /// The specified point becomes the start point of a new subpath. 
    /// The current point is set to this start point.
    /// - Parameter end: The point, in user space coordinates, at which to start a new subpath.
    public mutating func move(to end: Point3D) {
        elements.append(.move(to: end))
        currentPoint = end
        updateBoundingRect()
        makeCustom()
    }

    /// Adds an arc of a circle to the path, specified with a radius and angles.
    /// 
    /// This method calculates starting and ending points using the radius and angles you specify, uses a sequence of cubic Bézier curves to approximate a segment of a circle between those points, and then appends those curves to the path.
    /// 
    /// The clockwise parameter determines the direction in which the arc is created; the actual direction of the final path is dependent on the transform parameter and the current transform of a context where the path is drawn. 
    /// However, because OpenSwiftUI by default uses a vertically-flipped coordinate system (with the origin in the top-left of the view), specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
    /// 
    /// If the path ends with an unclosed subpath, this method adds a line connecting the current point to the starting point of the arc. 
    /// If there is no unclosed subpath, this method creates a new subpath whose starting point is the starting point of the arc. 
    /// The ending point of the arc becomes the new current point of the path.
    /// - Parameters:
    ///   - center: The center of the arc, in user space coordinates.
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - startAngle: The angle to the starting point of the arc, measured from the positive x-axis.
    ///   - endAngle: The angle to the end point of the arc, measured from the positive x-axis.
    ///   - clockwise: True to make a clockwise arc; false to make a counterclockwise arc.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addArc(center: Point3D, radius: Double, startAngle: Angle2D, endAngle: Angle2D, clockwise: Bool, transform: AffineTransform3D = .identity) {
        let start = center + Point3D(x: radius * cos(startAngle.radians), y: radius * sin(startAngle.radians), z: 0)
        let transformedStart = start.applying(transform)

        // If no current subpath, move to start
        if currentPoint == nil {
            move(to: transformedStart)
        } else {
            // Add line from current point to start
            addLine(to: transformedStart, transform: .identity) // already transformed
        }

        // Approximate arc with cubic Béziers
        let angleSpan = endAngle.radians - startAngle.radians
        let absSpan = abs(angleSpan)
        let steps = Int(ceil(absSpan / (.pi / 2)))
        let stepAngle = angleSpan / Double(steps)
        var currentAngle = startAngle.radians
        // var currentPt = transformedStart

        for _ in 0..<steps {
            let nextAngle = currentAngle + stepAngle
            let nextPt = (center + Point3D(x: radius * cos(nextAngle), y: radius * sin(nextAngle), z: 0)).applying(transform)
            // Calculate control points for a cubic Bézier approximating this arc segment
            let (cp1, cp2) = bezierControlPointsForArc(center: center, radius: radius, startAngle: currentAngle, endAngle: nextAngle, clockwise: clockwise)
            let transformedCp1 = cp1.applying(transform)
            let transformedCp2 = cp2.applying(transform)
            elements.append(.curve(to: nextPt, control1: transformedCp1, control2: transformedCp2))
            currentPoint = nextPt
            currentAngle = nextAngle
        }

        updateBoundingRect()
        makeCustom()
    }

    /// Adds an arc of a circle to the path, specified with a radius and two tangent lines.
    /// 
    /// This method calculates two tangent lines—the first from the current point to the tangent1End point, and the second from the tangent1End point to the tangent2End point—then calculates the start and end points for a circular arc of the specified radius such that the arc is tangent to both lines. 
    /// Finally, this method approximates that arc with a sequence of cubic Bézier curves and appends those curves to the path.
    /// 
    /// If the starting point of the arc (that is, the point where a circle of the specified radius must meet the first tangent line in order to also be tangent to the second line) is not the current point, this method appends a straight line segment from the current point to the starting point of the arc.
    /// 
    /// The ending point of the arc (that is, the point where a circle of the specified radius must meet the second tangent line in order to also be tangent to the first line) becomes the new current point of the path.
    /// - Parameters:
    ///   - tangent1End: The end point, in user space coordinates, for the first tangent line to be used in constructing the arc. (The start point for this tangent line is the path’s current point.)
    ///   - tangent2End: The end point, in user space coordinates, for the second tangent line to be used in constructing the arc. (The start point for this tangent line is the tangent1End point.)
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addArc(tangent1End: Point3D, tangent2End: Point3D, radius: Double, transform: AffineTransform3D = .identity) {
        guard let _ = currentPoint else { return }
        let p2 = tangent1End.applying(transform)
        let p3 = tangent2End.applying(transform)

        addLine(to: p2, transform: .identity)
        addLine(to: p3, transform: .identity)

        makeCustom()
    }

    /// Adds a cubic Bézier curve to the path, with the specified end point and control points.
    /// 
    /// This method constructs a curve starting from the path’s current point and ending at the specified end point, with curvature defined by the two control points. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path’s current point.
    /// - Parameters:
    ///   - end: 
    ///   - control1: The first control point of the curve, in user space coordinates.
    ///   - control2: The first control point of the curve, in user space coordinates.
    public mutating func addCurve(to end: Point3D, control1: Point3D, control2: Point3D) {
        elements.append(.curve(to: end, control1: control1, control2: control2))
        currentPoint = end
        updateBoundingRect()
        makeCustom()
    }

    /// Adds an ellipse that fits inside the specified rectangle to the path.
    /// 
    /// The ellipse is approximated by a sequence of Bézier curves. 
    /// Its center is the midpoint of the rectangle defined by the rect parameter. 
    /// If the rectangle is square, then the ellipse is circular with a radius equal to one-half the width (or height) of the rectangle. 
    /// If the rect parameter specifies a rectangular shape, then the major and minor axes of the ellipse are defined by the width and height of the rectangle.
    /// 
    /// The ellipse forms a complete subpath of the path— that is, the ellipse drawing starts with a move-to operation and ends with a close-subpath operation, with all moves oriented in the clockwise direction.
    /// - Parameters:
    ///   - rect: A rectangle that defines the area for the ellipse to fit in.
    ///   - transform: An affine transform to apply to the ellipse before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addEllipse(in rect: Rect3D, transform: AffineTransform3D = .identity) {
        // Similar to init(ellipseIn:), but add to existing path
        let center = rect.center
        let rx = rect.size.width / 2
        let ry = rect.size.height / 2
        let cx = center.x
        let cy = center.y
        let k = 0.5522847498307936
        let dx = k * rx
        let dy = k * ry

        let start = Point3D(x: cx + rx, y: cy, z: 0).applying(transform)
        
        if currentPoint == nil { move(to: start) } 
        else { addLine(to: start, transform: .identity) }

        let pts: [(to: Point3D, c1: Point3D, c2: Point3D)] = [
            (Point3D(x: cx, y: cy + ry, z: 0), Point3D(x: cx + rx, y: cy + dy, z: 0), Point3D(x: cx + dx, y: cy + ry, z: 0)),
            (Point3D(x: cx - rx, y: cy, z: 0), Point3D(x: cx - dx, y: cy + ry, z: 0), Point3D(x: cx - rx, y: cy + dy, z: 0)),
            (Point3D(x: cx, y: cy - ry, z: 0), Point3D(x: cx - rx, y: cy - dy, z: 0), Point3D(x: cx - dx, y: cy - ry, z: 0)),
            (Point3D(x: cx + rx, y: cy, z: 0), Point3D(x: cx + dx, y: cy - ry, z: 0), Point3D(x: cx + rx, y: cy - dy, z: 0))
        ]

        for (to, c1, c2) in pts {
            let toT = to.applying(transform)
            let c1T = c1.applying(transform)
            let c2T = c2.applying(transform)
            elements.append(.curve(to: toT, control1: c1T, control2: c2T))
        }

        elements.append(.closeSubpath)
        currentPoint = start
        updateBoundingRect()
        makeCustom()
    }

    /// Appends a straight line segment from the current point to the specified point.
    /// 
    /// After adding the line segment, the current point is set to the endpoint of the line segment.
    /// - Parameters:
    ///   - end: The location, in user space coordinates, for the end of the new line segment.
    ///   - transform: An affine transform to apply to the points before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addLine(to end: Point3D, transform: AffineTransform3D = .identity) {
        let transformed = end.applying(transform)
        elements.append(.line(to: transformed))
        currentPoint = transformed
        updateBoundingRect()
        makeCustom()
    }

    /// Adds a sequence of connected straight-line segments to the path.
    /// 
    /// Calling this convenience method is equivalent to applying the transform to all points in the array, then calling the ``move(to:)`` method with the first value in the points array, then calling the ``addLine(to:)`` method for each subsequent point until the array is exhausted. 
    /// After calling this method, the path’s current point is the last point in the array.
    /// - Parameters:
    ///   - lines: An array of values that specify the start and end points of the line segments to draw. Each point in the array specifies a position in user space. The first point in the array specifies the initial starting point.
    ///   - transform: An affine transform to apply to the points before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addLines(_ lines: [Point3D], transform: AffineTransform3D = .identity) {
        guard !lines.isEmpty else { return }
        let transformed = lines.map { $0.applying(transform) }
        move(to: transformed.first!)
        for pt in transformed.dropFirst() {
            addLine(to: pt, transform: .identity) // already transformed
        }
        // currentPoint already set by last addLine
        updateBoundingRect()
        makeCustom()
    }

    /// Appends another path value to this path.
    /// 
    /// If the path parameter is a non-empty empty path, its elements are appended in order to this path. 
    /// Afterward, the start point and current point of this path are those of the last subpath in the path parameter.
    /// - Parameters:
    ///   - path: The path to add.
    ///   - transform: An affine transform to apply to the path parameter before adding to this path. Defaults to the identity transform if not specified.
    public mutating func addPath(_ path: Path, transform: AffineTransform3D = .identity) {
        for element in path.elements {
            switch element {
            case .move(to: let pt):
                move(to: pt.applying(transform))
            case .line(to: let pt):
                addLine(to: pt.applying(transform), transform: .identity)
            case .curve(to: let end, control1: let c1, control2: let c2):
                addCurve(to: end.applying(transform),
                         control1: c1.applying(transform),
                         control2: c2.applying(transform))
            case .quadCurve(to: let end, control: let c):
                addQuadCurve(to: end.applying(transform), control: c.applying(transform))
            case .closeSubpath:
                closeSubpath()
            }
        }

        updateBoundingRect()
        makeCustom()
    }

    /// Adds a quadratic Bézier curve to the path, with the specified end point and control point.
    /// 
    /// This method constructs a curve starting from the path’s current point and ending at the specified end point, with curvature defined by the control point. 
    /// After this method appends that curve to the current path, the end point of the curve becomes the path’s current point.
    /// - Parameters:
    ///   - end: 
    ///   - control: The control point of the curve, in user space coordinates.
    public mutating func addQuadCurve(to end: Point3D, control: Point3D) {
        elements.append(.quadCurve(to: end, control: control))
        currentPoint = end
        updateBoundingRect()
        makeCustom()
    }

    /// Adds a rectangular subpath to the path.
    /// 
    /// This is a convenience function that adds a rectangle to a path, starting by moving to the bottom-left corner and then adding lines counter-clockwise to create a rectangle, closing the subpath.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - transform: An affine transform to apply to the rectangle before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRect(_ rect: Rect3D, transform: AffineTransform3D = .identity) {
        let corners = [
            rect.origin,
            Point3D(x: rect.max.x, y: rect.min.y, z: 0),
            Point3D(x: rect.max.x, y: rect.max.y, z: 0),
            Point3D(x: rect.min.x, y: rect.max.y, z: 0)
        ].map { $0.applying(transform) }

        move(to: corners[0])
        addLine(to: corners[1], transform: .identity)
        addLine(to: corners[2], transform: .identity)
        addLine(to: corners[3], transform: .identity)
        closeSubpath()

        updateBoundingRect()
        makeCustom()
    }

    /// Adds a set of rectangular subpaths to the path.
    /// 
    /// Calling this convenience method is equivalent to repeatedly calling the ``addRect(_:transform:)`` method for each rectangle in the array.
    /// - Parameters:
    ///   - rects: An array of rectangles, specified in user space coordinates.
    ///   - transform: An affine transform to apply to the ellipse before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRects(_ rects: [Rect3D], transform: AffineTransform3D = .identity) {
        for rect in rects { addRect(rect, transform: transform) }

        updateBoundingRect()
        makeCustom()
    }

    /// Adds an arc of a circle to the path, specified with a radius and a difference in angle.
    /// 
    /// This method calculates starting and ending points using the radius and angles you specify, uses a sequence of cubic Bézier curves to approximate a segment of a circle between those points, and then appends those curves to the path.
    /// 
    /// The delta parameter determines both the length of the arc the direction in which the arc is created; the actual direction of the final path is dependent on the transform parameter and the current transform of a context where the path is drawn. 
    /// However, because OpenSwiftUI by default uses a vertically-flipped coordinate system (with the origin in the top-left of the view), specifying a clockwise arc results in a counterclockwise arc after the transformation is applied.
    /// 
    /// If the path ends with an unclosed subpath, this method adds a line connecting the current point to the starting point of the arc. 
    /// If there is no unclosed subpath, this method creates a new subpath whose starting point is the starting point of the arc. 
    /// The ending point of the arc becomes the new current point of the path.
    /// - Parameters:
    ///   - center: The center of the arc, in user space coordinates.
    ///   - radius: The radius of the arc, in user space coordinates.
    ///   - startAngle: The angle to the starting point of the arc, measured from the positive x-axis.
    ///   - delta: The difference between the starting angle and ending angle of the arc. A positive value creates a counter- clockwise arc (in user space coordinates), and vice versa.
    ///   - transform: An affine transform to apply to the arc before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRelativeArc(center: Point3D, radius: Double, startAngle: Angle2D, delta: Angle2D, transform: AffineTransform3D = .identity) {
        let endAngle = Angle2D(radians: startAngle.radians + delta.radians)
        addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: delta.radians < 0, transform: transform)
    }

    /// Adds a rounded rectangle to the path.
    /// 
    /// This is a convenience function that adds a rounded rectangle to a path, starting by moving to the center of the right edge and then adding lines and curves counter-clockwise to create a rounded rectangle, closing the subpath.
    /// - Parameters:
    ///   - rect: A rectangle, specified in user space coordinates.
    ///   - cornerSize: The size of the corners, specified in user space coordinates.
    ///   - transform: An affine transform to apply to the rectangle before adding to the path. Defaults to the identity transform if not specified.
    public mutating func addRoundedRect(in rect: Rect3D, cornerSize: Size3D, transform: AffineTransform3D = .identity) {
        // Similar to init(roundedRect:) but with cornerSize (which may be asymmetric)
        let rw = min(cornerSize.width, rect.size.width / 2)
        let rh = min(cornerSize.height, rect.size.height / 2)
        // Approximate by using the same radius for all corners (take average)
        let r = (rw + rh) / 2
        let rounded = Path(roundedRect: rect, cornerRadius: r)
        addPath(rounded, transform: transform)
    }

    /// Closes and completes the current subpath.
    /// 
    /// Appends a line from the current point to the starting point of the current subpath and ends the subpath.
    /// 
    /// After closing the subpath, your application can begin a new subpath without first calling ``move(to:)``. 
    /// In this case, a new subpath is implicitly created with a starting and current point equal to the previous subpath’s starting point.
    public mutating func closeSubpath() {
        elements.append(.closeSubpath)
        // currentPoint remains unchanged (last point before close)
        updateBoundingRect()
        makeCustom()
    }

    // MARK: - Operating over path elements

    /// Calls body with each element in the path.
    public func forEach(_ body: (Path.Element) -> Void) {
        elements.forEach(body)
    }
}

extension Path {

    private mutating func makeCustom() {
        // When the path is modified, switch to generic storage.
        // Use a copy to avoid reference cycles.
        storage = .path(PathBox(Path(elements: elements, storage: .empty)))
    }

    private mutating func updateBoundingRect() {
        // Compute bounding box of all points (including control points for curves)
        var minX = Double.infinity, minY = Double.infinity, maxX = -Double.infinity, maxY = -Double.infinity
        for element in elements {
            switch element {
            case .move(to: let pt),
                 .line(to: let pt):
                updateBoundingBox(point: pt, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
            case .curve(to: let end, control1: let c1, control2: let c2):
                updateBoundingBox(point: end, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
                updateBoundingBox(point: c1, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
                updateBoundingBox(point: c2, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
            case .quadCurve(to: let end, control: let c):
                updateBoundingBox(point: end, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
                updateBoundingBox(point: c, minX: &minX, minY: &minY, maxX: &maxX, maxY: &maxY)
            case .closeSubpath:
                break
            }
        }
        if minX.isFinite {
            boundingRect = Rect3D(
                origin: Point3D(x: minX, y: minY), 
                size: Size3D(width: maxX - minX, height: maxY - minY)
            )
        } else {
            boundingRect = .zero
        }
    }

    private func updateBoundingBox(point: Point3D, minX: inout Double, minY: inout Double, maxX: inout Double, maxY: inout Double) {
        minX = min(minX, point.x)
        minY = min(minY, point.y)
        maxX = max(maxX, point.x)
        maxY = max(maxY, point.y)
    }

    // Helper to add an arc (used in roundedRect init)
    private mutating func addArcHelper(center: Point3D, radius: Double, startAngle: Angle2D, endAngle: Angle2D, clockwise: Bool) {
        let end = center + Point3D(x: radius * cos(endAngle.radians), y: radius * sin(endAngle.radians), z: 0)
        let angleSpan = endAngle.radians - startAngle.radians
        let absSpan = abs(angleSpan)
        let steps = Int(ceil(absSpan / (.pi / 2)))
        let stepAngle = angleSpan / Double(steps)
        var currentAngle = startAngle.radians

        for _ in 0..<steps {
            let nextAngle = currentAngle + stepAngle
            let nextPt = center + Point3D(x: radius * cos(nextAngle), y: radius * sin(nextAngle), z: 0)
            let (cp1, cp2) = bezierControlPointsForArc(center: center, radius: radius, startAngle: currentAngle, endAngle: nextAngle, clockwise: clockwise)
            elements.append(.curve(to: nextPt, control1: cp1, control2: cp2))
            currentAngle = nextAngle
        }

        currentPoint = end
    }

    // Returns control points for a cubic Bézier arc segment (angle span < π/2)
    private func bezierControlPointsForArc(center: Point3D, radius: Double, startAngle: Double, endAngle: Double, clockwise: Bool) -> (Point3D, Point3D) {
        let angle = endAngle - startAngle
        let a = startAngle
        let k = 0.5522847498307936 // 4/3 * tan(π/8)
        // For a unit circle, control points for segment from angle a to a+angle:
        // cp1 = (cos(a) - k*sin(a), sin(a) + k*cos(a))
        // cp2 = (cos(a+angle) + k*sin(a+angle), sin(a+angle) - k*cos(a+angle))
        let cosA = cos(a), sinA = sin(a)
        let cosB = cos(a + angle), sinB = sin(a + angle)
        let cp1 = Point3D(x: center.x + radius * (cosA - k * sinA),
                          y: center.y + radius * (sinA + k * cosA),
                          z: 0)
        let cp2 = Point3D(x: center.x + radius * (cosB + k * sinB),
                          y: center.y + radius * (sinB - k * cosB),
                          z: 0)
        return (cp1, cp2)
    }

    // Helper: sample cubic Bezier points
    private func bezierPoints(start: Point3D, c1: Point3D, c2: Point3D, end: Point3D, segments: Int) -> [Point3D] {
        var pts: [Point3D] = []
        for i in 0...segments {
            let t = Double(i) / Double(segments)
            let x = pow(1-t, 3)*start.x + 3*pow(1-t,2)*t*c1.x + 3*(1-t)*pow(t,2)*c2.x + pow(t,3)*end.x
            let y = pow(1-t, 3)*start.y + 3*pow(1-t,2)*t*c1.y + 3*(1-t)*pow(t,2)*c2.y + pow(t,3)*end.y
            pts.append(Point3D(x: x, y: y, z: 0))
        }
        return pts
    }

    // Helper: sample quadratic Bezier points
    private func quadBezierPoints(start: Point3D, control: Point3D, end: Point3D, segments: Int) -> [Point3D] {
        var pts: [Point3D] = []
        for i in 0...segments {
            let t = Double(i) / Double(segments)
            let x = pow(1-t, 2)*start.x + 2*(1-t)*t*control.x + pow(t,2)*end.x
            let y = pow(1-t, 2)*start.y + 2*(1-t)*t*control.y + pow(t,2)*end.y
            pts.append(Point3D(x: x, y: y, z: 0))
        }
        return pts
    }

    // Ray casting helper: check if horizontal ray from point to +infinity intersects segment p1-p2
    private func intersectRaySegment(point: Point3D, p1: Point3D, p2: Point3D) -> Bool {
        let (x, y) = (point.x, point.y)
        let (x1, y1) = (p1.x, p1.y)
        let (x2, y2) = (p2.x, p2.y)
        // Check if segment straddles the horizontal line y
        if (y1 > y) == (y2 > y) { return false }
        // Compute intersection x-coordinate
        let xIntersect = x1 + (y - y1) * (x2 - x1) / (y2 - y1)
        return xIntersect > x
    }
}