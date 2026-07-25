
import Foundation

/// The inputs passed to `_viewListCount`.
///
/// In the real AttributeGraph this carries the list-identity seed and
/// environment so that `ForEach` can compute its count without building
/// any nodes. Here it wraps only what is strictly necessary.
public struct _ViewListCountInputs {
    
    /// The environment propagated from the parent.
    var environment: _GraphValue<EnvironmentValues>

    init(environment: _GraphValue<EnvironmentValues>) {
        self.environment = environment
    }
}