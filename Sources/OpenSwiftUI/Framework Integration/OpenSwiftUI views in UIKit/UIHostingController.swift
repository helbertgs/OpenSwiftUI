#if os(iOS) || canImport(UIKit)

import UIKit

/// A UIKit view controller that manages a SwiftUI view hierarchy.
///
/// Create a `UIHostingController` object when you want to integrate SwiftUI
/// views into a UIKit view hierarchy. At creation time, specify the SwiftUI
/// view you want to use as the root view for this view controller; you can
/// change that view later using the ``SwiftUI/UIHostingController/rootView``
/// property. Use the hosting controller like you would any other view
/// controller, by presenting it or embedding it as a child view controller
/// in your interface.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
open class UIHostingController<Content> : UIViewController where Content : View {

    // MARK: - Property(ies).

    /// The root view of the SwiftUI view hierarchy managed by this view
    /// controller.
    public var rootView: Content

//    var allowedBehaviours: HostingControllerAllowedBehaviors = .default
//    var requiredBridges: HostingControllerBridges = .none
    var host: _UIHostingView<Content>
//    var overrides: HostingControllerOverrides = .init(pushTarget: nil, navigation: nil, split: nil)
//

//    /// The options for how the hosting controller tracks changes to the size
//    /// of its SwiftUI content.
//    ///
//    /// The default value is the empty set.
//    @available(iOS 16.0, tvOS 16.0, *)
//    @available(macOS, unavailable)
//    @available(watchOS, unavailable)
//    public var sizingOptions: UIHostingControllerSizingOptions {
//        .preferredContentSize
//    }
//
//    override dynamic open var isModalInPresentation: Bool {
//        get { fatalError() }
//        set { print(newValue) }
//    }
//
//    override dynamic open var keyCommands: [UIKeyCommand]? {
//        fatalError()
//    }
//
//    /// The preferred status bar style for the view controller.
//    override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
//        get { fatalError() }
//    }
//
//    /// A Boolean value that indicates whether the view controller prefers the
//    /// status bar to be hidden or shown.
//    override dynamic open var prefersStatusBarHidden: Bool {
//        get { fatalError() }
//    }
//
//    /// The animation style to use when hiding or showing the status bar for
//    /// this view controller.
//    override dynamic open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
//        get { fatalError() }
//    }
//
//    override dynamic open var childForStatusBarStyle: UIViewController? {
//        get { fatalError() }
//    }
//
//    override dynamic open var childForStatusBarHidden: UIViewController? {
//        get { fatalError() }
//    }
//
//    override dynamic open var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
//        get { fatalError() }
//    }
//
//    override dynamic open var childForScreenEdgesDeferringSystemGestures: UIViewController? {
//        get { fatalError() }
//    }
//
//    /// A Boolean value that indicates whether the view controller prefers the
//    /// home indicator to be hidden or shown.
//    override dynamic open var prefersHomeIndicatorAutoHidden: Bool {
//        get { fatalError() }
//    }
//
//    override dynamic open var childForHomeIndicatorAutoHidden: UIViewController? {
//        get { fatalError() }
//    }

    // MARK: - Constructor(s).

    /// Creates a hosting controller object that wraps the specified SwiftUI
    /// view.
    ///
    /// - Parameter rootView: The root view of the SwiftUI view hierarchy that
    ///   you want to manage using the hosting view controller.
    ///
    /// - Returns: A `UIHostingController` object initialized with the
    ///   specified SwiftUI view.
    public init(rootView: Content) {
        self.rootView = rootView
        self.host = .init(_rootView: rootView)
        super.init(nibName: nil, bundle: nil)
    }

    /// Creates a hosting controller object from an archive and the specified
    /// SwiftUI view.
    /// - Parameters:
    ///   - coder: The decoder to use during initialization.
    ///   - rootView: The root view of the SwiftUI view hierarchy that you want
    ///     to manage using this view controller.
    ///
    /// - Returns: A `UIViewController` object that you can present from your
    ///   interface.
    public init?(coder aDecoder: NSCoder, rootView: Content) {
        fatalError()
    }

    // MARK: - Function(s).

    /// Creates a hosting controller object from the contents of the specified
    /// archive.
    ///
    /// The default implementation of this method throws an exception. To create
    /// your view controller from an archive, override this method and
    /// initialize the superclass using the ``init(coder:rootView:)`` method
    /// instead.
    ///
    /// -Parameter coder: The decoder to use during initialization.
    required dynamic public init?(coder aDecoder: NSCoder) {
        fatalError()
    }

//    override dynamic open func loadView() {
//        guard var dynamicProperty = rootView as? DynamicProperty else {
//            return
//        }
//
//        dynamicProperty.update()
//    }
//
//    /// Notifies the view controller that its view is about to be added to a
//    /// view hierarchy.
//    ///
//    /// SwiftUI calls this method before adding the hosting controller's root
//    /// view to the view hierarchy. You can override this method to perform
//    /// custom tasks associated with the appearance of the view. If you
//    /// override this method, you must call `super` at some point in your
//    /// implementation.
//    ///
//    /// - Parameter animated: If `true`, the view is being added
//    ///   using an animation.
//    override dynamic open func viewWillAppear(_ animated: Bool) {
//        fatalError()
//    }
//
//    /// Notifies the view controller that its view has been added to a
//    /// view hierarchy.
//    ///
//    /// SwiftUI calls this method after adding the hosting controller's root
//    /// view to the view hierarchy. You can override this method to perform
//    /// custom tasks associated with the appearance of the view. If you
//    /// override this method, you must call `super` at some point in your
//    /// implementation.
//    ///
//    /// - Parameter animated: If `true`, the view is being added
//    ///   using an animation.
//    override dynamic open func viewDidAppear(_ animated: Bool) {
//        fatalError()
//    }
//
//    /// Notifies the view controller that its view will be removed from a
//    /// view hierarchy.
//    ///
//    /// SwiftUI calls this method before removing the hosting controller's root
//    /// view from the view hierarchy. You can override this method to perform
//    /// custom tasks associated with the disappearance of the view. If you
//    /// override this method, you must call `super` at some point in your
//    /// implementation.
//    ///
//    /// - Parameter animated: If `true`, the view is being removed
//    ///   using an animation.
//    override dynamic open func viewWillDisappear(_ animated: Bool) {
//        fatalError()
//    }
//
//    override dynamic open func viewDidDisappear(_ animated: Bool) {
//        fatalError()
//    }
//
//    override dynamic open func viewWillLayoutSubviews() {
//        fatalError()
//    }
//
//    /// Calculates and returns the most appropriate size for the current view.
//    ///
//    /// - Parameter size: The proposed new size for the view.
//    ///
//    /// - Returns: The size that offers the best fit for the root view and its
//    ///   contents.
//    public func sizeThatFits(in size: CGSize) -> CGSize {
//        fatalError()
//    }
//
//    override dynamic open func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
//        fatalError()
//    }
//
//    override dynamic open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        fatalError()
//    }
//
//    override dynamic open func willMove(toParent parent: UIViewController?) {
//        fatalError()
//    }
//
//    override dynamic open func didMove(toParent parent: UIViewController?) {
//        fatalError()
//    }
//
//    /// Sets the screen edge from which you want your gesture to take
//    /// precedence over the system gesture.
//
//    override dynamic open func target(forAction action: Selector, withSender sender: Any?) -> Any? {
//        fatalError()
//    }
}

#endif
