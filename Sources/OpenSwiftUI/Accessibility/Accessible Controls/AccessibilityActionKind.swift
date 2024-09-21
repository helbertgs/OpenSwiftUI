import Foundation

/// The structure that defines the kinds of available accessibility actions.
public struct AccessibilityActionKind : Equatable, Sendable {

    // MARK: - Getting the kind of action

    var kind: ActionKind

    /// The value that represents the default accessibility action.
    public static var `default`: AccessibilityActionKind {
        .init(kind: .default)
    }
    
    /// The value that represents an accessibility action that dismisses a modal view or cancels an operation.
    public static var escape: AccessibilityActionKind {
        .init(kind: .escape)
    }

    public static var delete: AccessibilityActionKind {
        .init(kind: .delete)
    }

    public static var magicTap: AccessibilityActionKind {
         .init(kind: .magicTap)
    }

    public static var showMenu: AccessibilityActionKind {
         .init(kind: .showMenu)
    }

    // MARK: - Creating an action type

    public init(named name: Text) {
        self = .init(kind: .custom(name))
    }

    init(kind: ActionKind) {
        self.kind = kind
    } 
}

extension AccessibilityActionKind {
    enum ActionKind: Equatable {
        case `default`
        case escape
        case delete
        case magicTap
        case showMenu
        case custom(Text)

        static func == (_ lhs: ActionKind, _ rhs: ActionKind) -> Bool {
            return switch (lhs, rhs) {
                case (.default, .default): true
                case (.escape, .escape): true
                case (.delete, .delete): true
                case (.magicTap, .magicTap): true
                case (.showMenu, .showMenu): true
                case let (.custom(txtLhs), .custom(txtRhs)): txtLhs == txtRhs
                default: false
            }
        }
    }
}