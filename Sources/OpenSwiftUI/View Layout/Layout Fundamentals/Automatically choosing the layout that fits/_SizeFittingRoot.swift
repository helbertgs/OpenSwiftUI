import Foundation

public struct _SizeFittingRoot : _VariadicView.UnaryViewRoot {
    var axes: Axis.Set
    
    init(axes: Axis.Set) { 
        self.axes = axes 
    }
    
    public static func _makeView(root: _GraphValue<_SizeFittingRoot>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewListOutputs) -> _ViewOutputs {
        fatalError("not implemented yet")
    }
}