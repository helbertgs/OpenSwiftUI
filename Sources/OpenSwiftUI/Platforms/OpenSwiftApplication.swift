import Swift

@MainActor
class OpenSwiftApplication {
    
    // MARK: - Property(ies).
    
    var appGraph: AppGraph!

    // MARK: - Static Property(ies).
    
    static let shared = OpenSwiftApplication()

    // MARK: - Constructor(s).
    
    init() { }

    // MARK: - Function(s).

    func run<T>(_ app: T) where T : App {
        print("\(Self.self) - ", #function)
         self.appGraph = .init(app)
    }
}