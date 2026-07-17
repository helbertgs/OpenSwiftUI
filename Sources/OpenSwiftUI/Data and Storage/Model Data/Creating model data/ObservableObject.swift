import OpenCombine

extension ObservableObject {
    
    /// The key path to the observable object store in the environment.
    static var environmentStore: WritableKeyPath<EnvironmentValues, Self> {
        fatalError("Must be implemented by conforming type")
    }
}