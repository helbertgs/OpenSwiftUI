import Foundation

@frozen public struct StrokeStyle {

    // MARK: - Setting stroke style properties
    
    /// The width of the stroked path.
    public let lineWidth: Double

    /// The endpoint style of a line.
    public let lineCap: LineCap

    /// The join type of a line.
    public let lineJoin: LineJoin

    /// A threshold used to determine whether to use a bevel instead of a miter at a join.
    public let miterLimit: Double

    /// The lengths of painted and unpainted segments used to make a dashed line.
    public let dash: [Double]

    /// How far into the dash pattern the line starts.
    public let dashPhase: Double

    // MARK: - 

    /// Creates a new stroke style from the given components.
    /// 
    /// - Parameters:
    ///   - lineWidth: The width of the segment.
    ///   - lineCap: The endpoint style of a segment.
    ///   - lineJoin: The join type of a segment.
    ///   - miterLimit: The threshold used to determine whether to use a bevel instead of a miter at a join.
    ///   - dash: The lengths of painted and unpainted segments used to make a dashed line.
    ///   - dashPhase: How far into the dash pattern the line starts.
    public init(lineWidth: Double = 1, lineCap: LineCap = .butt, lineJoin: LineJoin = .miter, miterLimit: Double = 10, dash: [Double] = [Double](), dashPhase: Double = 0) {
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.dash = dash
        self.dashPhase = dashPhase
    }
}