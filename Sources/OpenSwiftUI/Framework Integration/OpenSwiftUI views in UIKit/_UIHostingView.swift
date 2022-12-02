#if os(iOS) || canImport(UIKit)

import UIKit

class _UIHostingView<Content> : UIView where Content : View {

    // MARK: - Property(ies).

    var _rootView: AnyView
    var environmentValues: EnvironmentValues = .init()
    var overridedEvenvironmentValues: EnvironmentValues = .init()

    // MARK: - Constructor(s).

    init(_ rootView: Content) {
        self._rootView = AnyView(rootView)
        super.init(frame: .zero)

        backgroundColor = .green
    }

    init(_ rootView: AnyView) {
        self._rootView = rootView
        super.init(frame: .zero)

        backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
