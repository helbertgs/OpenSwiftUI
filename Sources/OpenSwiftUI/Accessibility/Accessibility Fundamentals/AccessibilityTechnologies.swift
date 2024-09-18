import Swift

/// Accessibility technologies available to the system.
public struct AccessibilityTechnologies : SetAlgebra, Equatable, Hashable, Sendable {

    // MARK: - Type Alias.

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = AccessibilityTechnologies

    /// A type for which the conforming type provides a containment test.
    public typealias Element = AccessibilityTechnologies

    // MARK: - Private Property(ies).

    @usableFromInline var technologySet : AccessibilityTechnologySet?

    // MARK: - Static Property(ies).

    /// The value that represents the VoiceOver screen reader, allowing use
    /// of the system without seeing the screen visually.
    public static let voiceOver: AccessibilityTechnologies = .init(technologySet: .voiceOver)

    /// The value that represents a switch control, allowing the use of the
    /// entire system using controller buttons, a breath-controlled switch or similar hardware.
    public static let switchControl: AccessibilityTechnologies = .init(technologySet: .switchControl)

    // MARK: - Constructor(s).

    @usableFromInline init(technologySet: AccessibilityTechnologySet) {
        self.technologySet = technologySet
    }

    /// Creates a new accessibility technologies structure with an empy accessibility technology set.
    @inlinable public init() { }

    // MARK: - Public Function(s).

    /// Returns a new set with the elements of both this and the given set.
    ///
    /// In the following example, the `attendeesAndVisitors` set is made up
    /// of the elements of the `attendees` and `visitors` sets:
    ///
    ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors = ["Marcia", "Nathaniel"]
    ///     let attendeesAndVisitors = attendees.union(visitors)
    ///     print(attendeesAndVisitors)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     let initialIndices = Set(0..<5)
    ///     let expandedIndices = initialIndices.union([2, 3, 6, 7])
    ///     print(expandedIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set with the unique elements of this set and `other`.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func union(_ other: AccessibilityTechnologies) -> AccessibilityTechnologies {
        fatalError("")
    }

    /// Adds the elements of the given set to the set.
    ///
    /// In the following example, the elements of the `visitors` set are added to
    /// the `attendees` set:
    ///
    ///     var attendees: Set = ["Alicia", "Bethany", "Diana"]
    ///     let visitors: Set = ["Diana", "Marcia", "Nathaniel"]
    ///     attendees.formUnion(visitors)
    ///     print(attendees)
    ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
    ///
    /// If the set already contains one or more elements that are also in
    /// `other`, the existing members are kept.
    ///
    ///     var initialIndices = Set(0..<5)
    ///     initialIndices.formUnion([2, 3, 6, 7])
    ///     print(initialIndices)
    ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formUnion(_ other: AccessibilityTechnologies) {
        fatalError("")
    }

    /// Returns a new set with the elements that are common to both this set and
    /// the given set.
    ///
    /// In the following example, the `bothNeighborsAndEmployees` set is made up
    /// of the elements that are in *both* the `employees` and `neighbors` sets.
    /// Elements that are in only one or the other are left out of the result of
    /// the intersection.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     let bothNeighborsAndEmployees = employees.intersection(neighbors)
    ///     print(bothNeighborsAndEmployees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    ///
    /// - Note: if this set and `other` contain elements that are equal but
    ///   distinguishable (e.g. via `===`), which of these elements is present
    ///   in the result is unspecified.
    public func intersection(_ other: AccessibilityTechnologies) -> AccessibilityTechnologies {
        fatalError("")
    }

    /// Removes the elements of this set that aren't also in the given set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// not also members of the `neighbors` set are removed. In particular, the
    /// names `"Alicia"`, `"Chris"`, and `"Diana"` are removed.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
    ///     employees.formIntersection(neighbors)
    ///     print(employees)
    ///     // Prints "["Bethany", "Eric"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    public mutating func formIntersection(_ other: AccessibilityTechnologies) {
        fatalError("")
    }

    /// Returns a new set with the elements that are either in this set or in the
    /// given set, but not in both.
    ///
    /// In the following example, the `eitherNeighborsOrEmployees` set is made up
    /// of the elements of the `employees` and `neighbors` sets that are not in
    /// both `employees` *and* `neighbors`. In particular, the names `"Bethany"`
    /// and `"Eric"` do not appear in `eitherNeighborsOrEmployees`.
    ///
    ///     let employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     let eitherNeighborsOrEmployees = employees.symmetricDifference(neighbors)
    ///     print(eitherNeighborsOrEmployees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type as the current set.
    /// - Returns: A new set.
    public func symmetricDifference(_ other: AccessibilityTechnologies) -> AccessibilityTechnologies {
        fatalError("")
    }

    /// Removes the elements of the set that are also in the given set and adds
    /// the members of the given set that are not already in the set.
    ///
    /// In the following example, the elements of the `employees` set that are
    /// also members of `neighbors` are removed from `employees`, while the
    /// elements of `neighbors` that are not members of `employees` are added to
    /// `employees`. In particular, the names `"Bethany"` and `"Eric"` are
    /// removed from `employees` while the name `"Forlani"` is added.
    ///
    ///     var employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
    ///     let neighbors: Set = ["Bethany", "Eric", "Forlani"]
    ///     employees.formSymmetricDifference(neighbors)
    ///     print(employees)
    ///     // Prints "["Diana", "Forlani", "Alicia"]"
    ///
    /// - Parameter other: A set of the same type.
    public mutating func formSymmetricDifference(_ other: AccessibilityTechnologies) {
        fatalError("")
    }

    /// Returns a Boolean value that indicates whether the given element exists
    /// in the set.
    ///
    /// This example uses the `contains(_:)` method to test whether an integer is
    /// a member of a set of prime numbers.
    ///
    ///     let primes: Set = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37]
    ///     let x = 5
    ///     if primes.contains(x) {
    ///         print("\(x) is prime!")
    ///     } else {
    ///         print("\(x). Not prime.")
    ///     }
    ///     // Prints "5 is prime!"
    ///
    /// - Parameter member: An element to look for in the set.
    /// - Returns: `true` if `member` exists in the set; otherwise, `false`.
    public func contains(_ member: AccessibilityTechnologies) -> Bool {
        false
    }

    /// Inserts the given element in the set if it is not already present.
    ///
    /// If an element equal to `newMember` is already contained in the set, this
    /// method has no effect. In this example, a new element is inserted into
    /// `classDays`, a set of days of the week. When an existing element is
    /// inserted, the `classDays` set does not change.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.wednesday, .friday]
    ///     print(classDays.insert(.monday))
    ///     // Prints "(true, .monday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    ///     print(classDays.insert(.friday))
    ///     // Prints "(false, .friday)"
    ///     print(classDays)
    ///     // Prints "[.friday, .wednesday, .monday]"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: `(true, newMember)` if `newMember` was not contained in the
    ///   set. If an element equal to `newMember` was already contained in the
    ///   set, the method returns `(false, oldMember)`, where `oldMember` is the
    ///   element that was equal to `newMember`. In some cases, `oldMember` may
    ///   be distinguishable from `newMember` by identity comparison or some
    ///   other means.
    public mutating func insert(_ newMember: AccessibilityTechnologies) -> (inserted: Bool, memberAfterInsert: AccessibilityTechnologies) {
        fatalError("")
    }

    /// Removes the given element and any elements subsumed by the given element.
    ///
    /// - Parameter member: The element of the set to remove.
    /// - Returns: For ordinary sets, an element equal to `member` if `member` is
    ///   contained in the set; otherwise, `nil`. In some cases, a returned
    ///   element may be distinguishable from `member` by identity comparison
    ///   or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the set
    ///   and `[member]`, or `nil` if the intersection is empty.
    public mutating func remove(_ member: AccessibilityTechnologies) -> AccessibilityTechnologies? {
        fatalError("")
    }

    /// Inserts the given element into the set unconditionally.
    ///
    /// If an element equal to `newMember` is already contained in the set,
    /// `newMember` replaces the existing element. In this example, an existing
    /// element is inserted into `classDays`, a set of days of the week.
    ///
    ///     enum DayOfTheWeek: Int {
    ///         case sunday, monday, tuesday, wednesday, thursday,
    ///             friday, saturday
    ///     }
    ///
    ///     var classDays: Set<DayOfTheWeek> = [.monday, .wednesday, .friday]
    ///     print(classDays.update(with: .monday))
    ///     // Prints "Optional(.monday)"
    ///
    /// - Parameter newMember: An element to insert into the set.
    /// - Returns: For ordinary sets, an element equal to `newMember` if the set
    ///   already contained such a member; otherwise, `nil`. In some cases, the
    ///   returned element may be distinguishable from `newMember` by identity
    ///   comparison or some other means.
    ///
    ///   For sets where the set type and element type are the same, like
    ///   `OptionSet` types, this method returns any intersection between the
    ///   set and `[newMember]`, or `nil` if the intersection is empty.
    public mutating func update(with newMember: AccessibilityTechnologies) -> AccessibilityTechnologies? {
        fatalError("")
    }

    // MARK: - Equatable.

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: AccessibilityTechnologies, rhs: AccessibilityTechnologies) -> Bool {
        lhs.technologySet == rhs.technologySet
    }
}
