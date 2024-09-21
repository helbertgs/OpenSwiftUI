import Foundation

/// The key used to look up an entry in a strings file or strings dictionary
/// file.
///
/// Initializers for several SwiftUI types -- such as ``Text``, ``Toggle``,
/// ``Picker`` and others --  implicitly look up a localized string when you
/// provide a string literal. When you use the initializer `Text("Hello")`,
/// SwiftUI creates a `LocalizedStringKey` for you and uses that to look up a
/// localization of the `Hello` string. This works because `LocalizedStringKey`
/// conforms to
/// <doc://com.apple.documentation/documentation/Swift/ExpressibleByStringLiteral>.
///
/// Types whose initializers take a `LocalizedStringKey` usually have
/// a corresponding initializer that accepts a parameter that conforms to
/// <doc://com.apple.documentation/documentation/Swift/StringProtocol>. Passing
/// a `String` variable to these initializers avoids localization, which is
/// usually appropriate when the variable contains a user-provided value.
///
/// As a general rule, use a string literal argument when you want
/// localization, and a string variable argument when you don't. In the case
/// where you want to localize the value of a string variable, use the string to
/// create a new `LocalizedStringKey` instance.
///
/// The following example shows how to create ``Text`` instances both
/// with and without localization. The title parameter provided to the
/// ``Section`` is a literal string, so SwiftUI creates a
/// `LocalizedStringKey` for it. However, the string entries in the
/// `messageStore.today` array are `String` variables, so the ``Text`` views
/// in the list use the string values verbatim.
///
///     List {
///         Section(header: Text("Today")) {
///             ForEach(messageStore.today) { message in
///                 Text(message.title)
///             }
///         }
///     }
///
/// If the app is localized into Japanese with the following
/// translation of its `Localizable.strings` file:
///
/// ```other
/// "Today" = "今日";
/// ```
///
/// When run in Japanese, the example produces a
/// list like the following, localizing "Today" for the section header, but not
/// the list items.
///
/// ![A list with a single section header displayed in Japanese.
/// The items in the list are all in English: New for Monday, Account update,
/// and Server
/// maintenance.](SwiftUI-LocalizedStringKey-Today-List-Japanese.png)
@frozen public struct LocalizedStringKey: Equatable, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringInterpolation, ExpressibleByStringLiteral, ExpressibleByUnicodeScalarLiteral, Sendable {

    /// A type that represents an extended grapheme cluster literal.
    ///
    /// Valid types for `ExtendedGraphemeClusterLiteralType` are `Character`,
    /// `String`, and `StaticString`.
    public typealias ExtendedGraphemeClusterLiteralType = String

    /// A type that represents a string literal.
    ///
    /// Valid types for `StringLiteralType` are `String` and `StaticString`.
    public typealias StringLiteralType = String

    /// A type that represents a Unicode scalar literal.
    ///
    /// Valid types for `UnicodeScalarLiteralType` are `Unicode.Scalar`,
    /// `Character`, `String`, and `StaticString`.
    public typealias UnicodeScalarLiteralType = String

    @usableFromInline
    let key: String

    @usableFromInline
    let hasFormatting: Bool = false

    /// Creates a localized string key from the given string value.
    ///
    /// - Parameter value: The string to use as a localization key.
    public init(_ value: String) {
        key = value
    }

    /// Creates a localized string key from the given string literal.
    ///
    /// - Parameter value: The string literal to use as a localization key.
    public init(stringLiteral value: String) {
        key = value
    }

    /// Creates a localized string key from the given string interpolation.
    ///
    /// To create a localized string key from a string interpolation, use
    /// the `\()` string interpolation syntax. Swift matches the parameter
    /// types in the expression to one of the `appendInterpolation` methods
    /// in ``LocalizedStringKey/StringInterpolation``. The interpolated
    /// types can include numeric values, Foundation types, and SwiftUI
    /// ``Text`` and ``Image`` instances.
    ///
    /// The following example uses a string interpolation with two arguments:
    /// an unlabeled
    /// <doc://com.apple.documentation/documentation/Foundation/Date>
    /// and a ``Text/DateStyle`` labeled `style`. The compiler maps these to the
    /// method
    /// ``LocalizedStringKey/StringInterpolation/appendInterpolation(_:style:)``
    /// as it builds the string that it creates the
    /// ``LocalizedStringKey`` with.
    ///
    ///     let key = LocalizedStringKey("Date is \(company.foundedDate, style: .offset)")
    ///     let text = Text(key) // Text contains "Date is +45 years"
    ///
    /// You can write this example more concisely, implicitly creating a
    /// ``LocalizedStringKey`` as the parameter to the ``Text``
    /// initializer:
    ///
    ///     let text = Text("Date is \(company.foundedDate, style: .offset)")
    ///
    /// - Parameter stringInterpolation: The string interpolation to use as the
    ///   localization key.
    public init(stringInterpolation: String) {
        key = stringInterpolation
    }
}