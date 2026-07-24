import OpenSpatial

extension Size3D {

    func scaledBy(x: Double = 1, y: Double = 1) -> Size3D {
        return Size3D(width: width == 0 ? 0 : width * x,
                      height: height == 0 ? 0 : height * y)
    }

    func scaled(by scale: Double) -> Size3D {
        return self.scaledBy(x: scale, y: scale)
    }

    func scaled(by scale: Size3D) -> Size3D {
        return self.scaledBy(x: scale.width, y: scale.height)
    }

    func increasedBy(dWidth: Double = 0, dHeight: Double = 0) -> Size3D {
        .init(width: width + dWidth, height: height + dHeight)
    }

    var flushingNaNs: Size3D {
        .init(width: !width.isNaN ? width : 0,
              height: !height.isNaN ? height : 0)
    }

    var flushingNegatives: Size3D {
        .init(width: max(width, 0.0), height: max(height, 0.0))
    }

    func approximates(_ other: Size3D, epsilon: Double) -> Bool {
        width.approximates(other.width, epsilon: epsilon)
        && height.approximates(other.height, epsilon: epsilon)
    }
}
extension Size3D {

    @inlinable package subscript(d: Axis) -> Double {
        get { return d == .horizontal ? width : height }
        set { if d == .horizontal { width = newValue } else { height = newValue } }
    }

    @inlinable package init(_ l1: Double, in first: Axis, by l2: Double) {
        self = first == .horizontal ? Size3D(width: l1, height: l2) : Size3D(width: l2, height: l1)
    }
}

extension Size3D {
    @inlinable package func contains(point p: Point3D) -> Bool {
        return !(p.x < 0) && !(p.y < 0) && p.x < width && p.y < height
    }
}

extension Size3D {

    mutating func round(_ rule: FloatingPointRoundingRule, toMultipleOf m: Double) {
        width.round(rule, toMultipleOf: m)
        height.round(rule, toMultipleOf: m)
    }

    mutating func round(toMultipleOf m: Double) {
        round(.toNearestOrAwayFromZero, toMultipleOf: m)
    }

    func rounded(_ rule: Swift.FloatingPointRoundingRule = .toNearestOrAwayFromZero, toMultipleOf m: Double) -> Size3D {
        var r = self
        r.round(rule, toMultipleOf: m)
        return r
    }

    func rounded(toMultipleOf m: Double) -> Size3D {
        rounded(.toNearestOrAwayFromZero, toMultipleOf: m)
    }
}

extension Size3D : Animatable {
   public typealias AnimatableData = AnimatablePair<Double, Double>
   public var animatableData: Size3D.AnimatableData {
       @inlinable get { return .init(width, height) }
       @inlinable set { (width, height) = (newValue.first, newValue.second) }
   }
}