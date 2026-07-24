import OpenSpatial

extension Point3D {

    func offsetBy(dx: Double, dy: Double) -> Point3D {
        .init(x: self.x + dx, y: self.y + dy)
    }

    func offsetBy(dx: Double) -> Point3D {
        offsetBy(dx: dx, dy: 0)
    }

    func offsetBy(dy: Double) -> Point3D {
        offsetBy(dx: 0, dy: dy)
    }

    func offset(by offset: Size3D) -> Point3D {
        offsetBy(dx: offset.width, dy: offset.height)
    }

    func scaledBy(x: Double, y: Double) -> Point3D {
        .init(x: self.x * x, y: self.y * y)
    }


    func scaledBy(x: Double) -> Point3D {
        scaledBy(x: x, y: 1)
    }

    func scaledBy(y: Double) -> Point3D {
        scaledBy(x: 1, y: y)
    }

    func scaled(by scale: Double) -> Point3D {
        scaledBy(x: scale, y: scale)
    }

    var flushingNaNs: Point3D {
        .init(x: !x.isNaN ? x : 0, y: !y.isNaN ? y : 0)
    }

    var flushingNegatives: Point3D {
        .init(x: max(x, 0.0), y: max(y, 0.0))
    }

    func approximates(_ other: Point3D, epsilon: Double) -> Bool {
        x.approximates(other.x, epsilon: epsilon)
        && y.approximates(other.y, epsilon: epsilon)
    }

    mutating func clamp(size: Size3D) {
        x.clamp(to: 0 ... size.width)
        y.clamp(to: 0 ... size.height)
    }

    func clamped(size: Size3D) -> Point3D {
        var point = self
        point.clamp(size: size)
        return point
    }

    mutating func clamp(rect: Rect3D) {
        x.clamp(to: rect.origin.x ... rect.size.width)
        y.clamp(to: rect.origin.y ... rect.size.height)
    }

    func clamped(rect: Rect3D) -> Point3D {
        var point = self
        point.clamp(rect: rect)
        return point
    }
}

extension Point3D {

    @inlinable package subscript(d: Axis) -> Double {
        get { return d == .horizontal ? x : y }
        set { if d == .horizontal { x = newValue } else { y = newValue } }
    }


    @inlinable package init(_ l1: Double, in first: Axis, by l2: Double) {
        self = first == .horizontal ? Point3D(x: l1, y: l2) :
            .init(x: l2, y: l1)
    }
}

extension Point3D {

    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: Double) {
        x.round(rule, toMultipleOf: m)
        y.round(rule, toMultipleOf: m)
    }

    mutating func round(toMultipleOf m: Double) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }

    func rounded(_ rule: Swift.FloatingPointRoundingRule, toMultipleOf m: Double) -> Point3D {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }

    func rounded(toMultipleOf m: Double) -> Point3D {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }

    mutating func roundToNearestOrUp(toMultipleOf m: Double) {
        x.roundToNearestOrUp(toMultipleOf: m)
        y.roundToNearestOrUp(toMultipleOf: m)
    }

    func roundedToNearestOrUp(toMultipleOf m: Double) -> Point3D {
        var r = self
        r.roundToNearestOrUp(toMultipleOf: m)
        return r
    }
}

extension Point3D : Animatable {

   public typealias AnimatableData = AnimatablePair<Double, Double>

   public var animatableData: AnimatableData {
       @inlinable get { return .init(x, y) }
       @inlinable set { (x, y) = (newValue.first, newValue.second) }
   }
}