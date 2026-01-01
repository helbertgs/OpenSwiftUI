import Foundation

public struct RelationshipModifier<Value> {

}

struct AccessibilityRelationshipModifier {
    let relationship: AccessibilityRelationshipScope

    init(relationship: AccessibilityRelationshipScope) {
        self.relationship = relationship
    }
}

struct AccessibilityRelationshipScope {
    enum Relationship {
        case labeledPair
    }
}