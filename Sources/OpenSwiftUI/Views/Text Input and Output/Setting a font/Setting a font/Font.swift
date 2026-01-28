//
// Font.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Jan 27, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// An environment-dependent font.
///
/// The system resolves a font's value at the time it uses the font in a given
/// environment because ``Font`` is a late-binding token.
public struct Font : Sendable {

    // private var library: FT_Library?

    /// The provider of the font.
    let provider: AnyFontProvider

    /// Creates a font with the given provider.
    ///
    /// - Parameter provider: The provider of the font.
    private init(provider: AnyFontProvider) {
        self.provider = provider
    }
}

extension Font {

    // MARK: - Getting standard fonts

    /// A font with the large title text style.
    public static var largeTitle: Font { 
        .init(provider: TextStyleProvider(style: .largeTitle))
    }

    /// A font with the title text style.
    public static var title: Font { 
        .init(provider: TextStyleProvider(style: .title))
    }

    /// Create a font for second level hierarchical headings.
    public static var title2: Font { 
        .init(provider: TextStyleProvider(style: .title2))
    }

    /// Create a font for third level hierarchical headings.
    public static var title3: Font { 
        .init(provider: TextStyleProvider(style: .title3))
    }

    /// A font with the headline text style.
    public static var headline: Font { 
        .init(provider: TextStyleProvider(style: .headline))
    }

    /// A font with the subheadline text style.
    public static var subheadline: Font { 
        .init(provider: TextStyleProvider(style: .subheadline))
    }

    /// A font with the body text style.
    public static var body: Font { 
        .init(provider: TextStyleProvider(style: .body))
    }

    /// A font with the callout text style.
    public static var callout: Font { 
        .init(provider: TextStyleProvider(style: .callout))
    }

    /// A font with the footnote text style.
    public static var footnote: Font { 
        .init(provider: TextStyleProvider(style: .footnote))
    }

    /// A font with the caption text style.
    public static var caption: Font { 
        .init(provider: TextStyleProvider(style: .caption))
    }

    /// Create a font with the alternate caption text style.
    public static var caption2: Font { 
        .init(provider: TextStyleProvider(style: .caption2))
    }

    /// Gets a system font that uses the specified style, design, and weight.
    ///
    /// Use this method to create a system font that has the specified
    /// properties. The following example creates a system font with the
    /// ``TextStyle/body`` text style, a ``Design/serif`` design, and
    /// a ``Weight/bold`` weight, and applies the font to a ``Text`` view
    /// using the ``View/font(_:)`` view modifier:
    ///
    ///     Text("Hello").font(.system(.body, design: .serif, weight: .bold))
    ///
    /// The `design` and `weight` parameters are both optional. If you omit
    /// either, the system uses a default value for that parameter. The
    /// default values are typically ``Design/default`` and ``Weight/regular``,
    /// respectively, but might vary depending on the context.
    public static func system(_ style: Font.TextStyle, design: Font.Design? = nil, weight: Font.Weight? = nil) -> Font {
        .init(provider: SystemProvider(size: 16.0, weight: weight, design: design, textStyle: style, maximumSize: nil))
    }
}

extension Font {

    /// Adds italics to the font.
    public func italic() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: ItalicModifier(true)))
    }

    /// Adds/removes italics on the font.
    public func italic(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: ItalicModifier(isActive)))
    }

    /// Adjusts the font to enable all small capitals.
    ///
    /// See ``Font/lowercaseSmallCaps()`` and ``Font/uppercaseSmallCaps()`` for
    /// more details.
    public func smallCaps() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 38, selector: 1)))
    }

    /// Adjusts the font to enable/disable all small capitals.
    ///
    /// See ``Font/lowercaseSmallCaps()`` and ``Font/uppercaseSmallCaps()`` for
    /// more details.
    public func smallCaps(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 38, selector: 1)))
    }

    /// Adjusts the font to enable lowercase small capitals.
    ///
    /// This function turns lowercase characters into small capitals for the
    /// font. It is generally used for display lines set in large and small
    /// caps, such as titles. It may include forms related to small capitals,
    /// such as old-style figures.
    public func lowercaseSmallCaps() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 37, selector: 1)))
    }

    /// Adjusts the font to enable/disable lowercase small capitals.
    ///
    /// This function controls turning lowercase characters into small capitals
    /// for the font. It is generally used for display lines set in large and
    /// small caps, such as titles. It may include forms related to small
    /// capitals, such as old-style figures.
    public func lowercaseSmallCaps(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 37, selector: 1)))
    }

    /// Adjusts the font to enable uppercase small capitals.
    ///
    /// This feature turns capital characters into small capitals. It is
    /// generally used for words which would otherwise be set in all caps, such
    /// as acronyms, but which are desired in small-cap form to avoid disrupting
    /// the flow of text.
    public func uppercaseSmallCaps() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 38, selector: 1)))
    }

    /// Adjusts the font to enable/disable uppercase small capitals.
    ///
    /// This feature controls turning capital characters into small capitals. It
    /// is generally used for words which would otherwise be set in all caps, such
    /// as acronyms, but which are desired in small-cap form to avoid disrupting
    /// the flow of text.
    public func uppercaseSmallCaps(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: FeatureSettingModifier(type: 38, selector: 1)))
    }

    /// Returns a modified font that uses fixed-width digits, while leaving
    /// other characters proportionally spaced.
    ///
    /// This modifier only affects numeric characters, and leaves all other
    /// characters unchanged. If the base font doesn't support fixed-width,
    /// or _monospace_ digits, the font remains unchanged.
    ///
    /// The following example shows two text fields arranged in a ``VStack``.
    /// Both text fields specify the 12-point system font, with the second
    /// adding the `monospacedDigit()` modifier to the font. Because the text
    /// includes the digit 1, normally a narrow character in proportional
    /// fonts, the second text field becomes wider than the first.
    ///
    ///     @State private var userText = "Effect of monospacing digits: 111,111."
    ///
    ///     var body: some View {
    ///         VStack {
    ///             TextField("Proportional", text: $userText)
    ///                 .font(.system(size: 12))
    ///             TextField("Monospaced", text: $userText)
    ///                 .font(.system(size: 12).monospacedDigit())
    ///         }
    ///         .padding()
    ///         .navigationTitle(Text("Font + monospacedDigit()"))
    ///     }
    ///
    /// ![A macOS window showing two text fields arranged vertically. Each
    /// shows the text Effect of monospacing digits: 111,111. The even spacing
    /// of the digit 1 in the second text field causes it to be noticably wider
    /// than the first.](Environment-Font-monospacedDigit-1)
    ///
    /// - Returns: A font that uses fixed-width numeric characters.
    public func monospacedDigit() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: MonospaceDigitModifier(true)))
    }

    /// Sets the weight of the font.
    public func weight(_ weight: Font.Weight) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: WeightModifier(weight)))
    }

    /// Sets the width of the font.
    public func width(_ width: Font.Width) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: WidthModifier(width)))
    }

    /// Adds bold or emphasized styling to the font.
    ///
    /// For fonts created from text styles, it could mean applying emphasized
    /// styling, which does not necessarily mean the bold weight specifically,
    /// so this modifier is not to be confused with
    /// <doc://com.apple.documentation/documentation/SwiftUI/Font/weight(_:)>.
    ///
    /// For example:
    ///
    ///     Font.body.bold()
    ///
    /// will most likely get you the emphasized version of body text style,
    /// which is often in <doc://com.apple.documentation/documentation/SwiftUI/Font/weight/semibold>
    /// weight. While
    ///
    ///     Font.body.weight(.bold)
    ///
    /// will specifically get you the body text style font in the
    /// <doc://com.apple.documentation/documentation/SwiftUI/Font/weight/bold>
    /// weight.
    public func bold() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: BoldModifier(true)))
    }

    /// Adds or removes bold or emphasized styling on the font.
    ///
    /// For fonts created from text styles, passing `true` could mean applying
    /// emphasized styling, which does not necessarily mean the bold weight
    /// specifically, so this modifier is not to be confused with
    /// <doc://com.apple.documentation/documentation/SwiftUI/Font/weight(_:)>.
    ///
    /// For example:
    ///
    ///     Font.body.bold(true)
    ///
    /// will most likely get you the emphasized version of body text style,
    /// which is often in <doc://com.apple.documentation/documentation/SwiftUI/Font/weight/semibold>
    /// weight. While
    ///
    ///     Font.body.weight(.bold)
    ///
    /// will specifically get you the body text style font in the
    /// <doc://com.apple.documentation/documentation/SwiftUI/Font/weight/bold>
    /// weight.
    ///
    /// Using:
    ///
    ///     Font.body.bold(false)
    ///
    /// will remove any emphasized styling from the font returning to its
    /// default weight which is most likely but not guaranteed to be 0.0
    /// or ``Weight/regular``.
    public func bold(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: BoldModifier(isActive)))
    }

    /// Returns a fixed-width font from the same family as the base font.
    ///
    /// If there's no suitable font face in the same family, SwiftUI
    /// returns a default fixed-width font.
    ///
    /// The following example adds the `monospaced()` modifier to the default
    /// system font, then applies this font to a ``Text`` view:
    ///
    ///     struct ContentView: View {
    ///         let myFont = Font
    ///             .system(size: 24)
    ///             .monospaced()
    ///
    ///         var body: some View {
    ///             Text("Hello, world!")
    ///                 .font(myFont)
    ///                 .padding()
    ///                 .navigationTitle("Monospaced")
    ///         }
    ///     }
    ///
    ///
    /// ![A macOS window showing the text Hello, world in a 24-point
    /// fixed-width font.](Environment-Font-monospaced-1)
    ///
    /// SwiftUI may provide different fixed-width replacements for standard
    /// user interface fonts (such as ``Font/title``, or a system font created
    /// with ``Font/system(_:design:)``) than for those same fonts when created
    /// by name with ``Font/custom(_:size:)``.
    ///
    /// The ``View/font(_:)`` modifier applies the font to all text within
    /// the view. To mix fixed-width text with other styles in the same
    /// `Text` view, use the ``Text/init(_:)-1a4oh`` initializer to use an
    /// appropropriately-styled
    /// <doc://com.apple.documentation/documentation/Foundation/AttributedString>
    /// for the text view's content. You can use the
    /// <doc://com.apple.documentation/documentation/Foundation/AttributedString/3796160-init>
    /// initializer to provide a Markdown-formatted string containing the
    /// backtick-syntax (\`…\`) to apply code voice to specific ranges
    /// of the attributed string.
    ///
    /// - Returns: A fixed-width font from the same family as the base font,
    /// if one is available, and a default fixed-width font otherwise.
    public func monospaced() -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: MonospacedModifier(true)))
    }

    /// Returns a font adding or removing fixed-width design from the same
    /// family as the base font.
    ///
    /// If there's no suitable font face in the same family, SwiftUI
    /// returns a default font.
    ///
    /// The following example adds the `monospaced()` modifier to the default
    /// system font, then applies this font to a ``Text`` view:
    ///
    ///     struct ContentView: View {
    ///         let myFont = Font
    ///             .system(size: 24)
    ///             .monospaced(true)
    ///
    ///         var body: some View {
    ///             Text("Hello, world!")
    ///                 .font(myFont)
    ///                 .padding()
    ///                 .navigationTitle("Monospaced")
    ///         }
    ///     }
    ///
    ///
    /// ![A macOS window showing the text Hello, world in a 24-point
    /// fixed-width font.](Environment-Font-monospaced-1)
    ///
    /// SwiftUI may provide different fixed-width replacements for standard
    /// user interface fonts (such as ``Font/title``, or a system font created
    /// with ``Font/system(_:design:)``) than for those same fonts when created
    /// by name with ``Font/custom(_:size:)``.
    ///
    /// The ``View/font(_:)`` modifier applies the font to all text within
    /// the view. To mix fixed-width text with other styles in the same
    /// `Text` view, use the ``Text/init(_:)-1a4oh`` initializer to use an
    /// appropriately-styled
    /// <doc://com.apple.documentation/documentation/Foundation/AttributedString>
    /// for the text view's content. You can use the
    /// <doc://com.apple.documentation/documentation/Foundation/AttributedString/3796160-init>
    /// initializer to provide a Markdown-formatted string containing the
    /// backtick-syntax (\`…\`) to apply code voice to specific ranges
    /// of the attributed string.
    ///
    /// - Returns: A font with the fixed-width design added or removed, from the
    ///  same family as the base font, if one is available, and a default
    ///  font otherwise.
    public func monospaced(_ isActive: Bool) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: MonospacedModifier(isActive)))
    }

    /// Adjusts the line spacing of a font.
    ///
    /// You can change a font's line spacing while maintaining other
    /// characteristics of the font by applying this modifier.
    /// For example, you can decrease spacing of the ``body`` font by
    /// applying the ``Leading/tight`` value to it:
    ///
    ///     let myFont = Font.body.leading(.tight)
    ///
    /// The availability of leading adjustments depends on the font. For some
    /// fonts, the modifier has no effect and returns the original font.
    ///
    /// - Parameter leading: The line spacing adjustment to apply.
    ///
    /// - Returns: A modified font that uses the specified line spacing, or
    ///   the original font if it doesn't support line spacing adjustments.
    public func leading(_ leading: Font.Leading) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: LeadingModifier(leading)))
    }

    /// Sets the point size of the font explicitly.
    ///
    /// Setting the point size explicitly will result in style based fonts
    /// no longer scaling with the device's preferred text size. To scale a
    /// font's size relative to its current size, see ``Font/scaled(by:)``.
    public func pointSize(_ size: Double) -> Font {
        .init(provider: StaticModifierProvider(base: provider, modifier: PointSizeModifier(size)))
    }
}

extension Font {

    /// The effective SwiftUI font used in any given environment.
    ///
    /// The font specified by environment, preferring first any developer
    /// spedified font, via ``EnvironmentValues/font``, then any framework
    /// specified font, and finally the default SwiftUI font.
    public static var `default`: Font { 
        fatalError("not implemented yet")
     }
}

extension Font {

    /// Create a custom font with the given `name` and `size` that scales with
    /// the body text style.
    public static func custom(_ name: String, size: Double) -> Font {
        .init(provider: NamedProvider(name: name, size: size, textStyle: .body))
    }

    /// Create a custom font with the given `name` and `size` that scales
    /// relative to the given `textStyle`.
    public static func custom(_ name: String, size: Double, relativeTo textStyle: Font.TextStyle) -> Font {
        .init(provider: NamedProvider(name: name, size: size, textStyle: textStyle))
    }

    /// Create a custom font with the given `name` and a fixed `size` that does
    /// not scale with Dynamic Type.
    public static func custom(_ name: String, fixedSize: Double) -> Font {
        .init(provider: NamedProvider(name: name, size: fixedSize))
    }
}

extension Font {

    /// Specifies a system font to use, along with the style, weight, and any
    /// design parameters you want applied to the text.
    ///
    /// Use this function to create a system font by specifying the size and
    /// weight, and a type design together. The following styles the system font
    /// as 17 point, ``Font/Weight/semibold`` text:
    ///
    ///     Text("Hello").font(.system(size: 17, weight: .semibold))
    ///
    /// While the following styles the text as 17 point ``Font/Weight/bold``,
    /// and applies a `serif` ``Font/Design`` to the system font:
    ///
    ///     Text("Hello").font(.system(size: 17, weight: .bold, design: .serif))
    ///
    /// Both `weight` and `design` can be optional. When you do not provide a
    /// `weight` or `design`, the system can pick one based on the current
    /// context, which may not be ``Font/Weight/regular`` or
    /// ``Font/Design/default`` in certain context. The following example styles
    /// the text as 17 point system font using ``Font/Design/rounded`` design,
    /// while its weight can depend on the current context:
    ///
    ///     Text("Hello").font(.system(size: 17, design: .rounded))
    public static func system(size: Double, weight: Font.Weight? = nil, design: Font.Design? = nil) -> Font {
        .init(provider: SystemProvider(size: size, weight: weight, design: design, textStyle: .body, maximumSize: nil))
    }
}