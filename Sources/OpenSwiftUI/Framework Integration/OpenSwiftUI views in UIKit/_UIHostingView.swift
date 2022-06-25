#if os(iOS) || canImport(UIKit)

import UIKit

class _UIHostingView<Content> : UIView where Content : View {

    // MARK: - Property(ies).

    var _rootView: Content

    // MARK: - Constructor(s).

    init(_rootView: Content) {
        self._rootView = _rootView
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
