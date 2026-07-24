//
// NSView.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Feb 10, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation
import OpenSpatial

/// The infrastructure for drawing, printing, and handling events in an app.
@MainActor
final class HostingView : Responder {

    // MARK: - Creating a view object

    /// Initializes and returns a newly allocated ``NSView`` object with a specified frame rectangle.
    /// 
    /// Insert the view into your window’s view hieararchy before you can do anything with it. 
    /// This method is the designated initializer for the ``NSView`` class.
    /// 
    /// - Parameter frame: The frame rectangle for the created view object.
    init(frame: Rect3D) {
        self.frame = frame
        super.init()
    }

    // MARK: - Getting the Related Objects

    /// The view that is the parent of the current view.
    var superview: HostingView?

    /// The array of views embedded in the current view.
    var subviews: [HostingView] = []

    /// The view’s window object, if it is installed in a window.
    weak var window: HostingWindow?

    // MARK: - Adding and Removing Subviews

    /// Adds a view to the view’s subviews so it’s displayed above its siblings.
    /// 
    /// This method also sets the view as the next responder of aView.
    /// 
    /// The view retains aView. If you use ``removeFromSuperview()`` to remove aView from the view hierarchy, aView is released. 
    /// If you want to keep using aView after removing it from the view hierarchy (if, for example, you are swapping through a number of views), you must retain it before invoking ``removeFromSuperview()``.
    /// 
    /// - Parameter view: The view to add to the view as a subview.
    func addSubview(_ view: HostingView) {
    }

    /// Unlinks the view from its superview and its window, removes it from the responder chain, and invalidates its cursor rectangles.
    /// 
    /// The view is also released; if you plan to reuse it, be sure to retain it before sending this message and to release it as appropriate when adding it as a subview of another ``NSView``.
    /// Calling this method removes any constraints that refer to the view you are removing, or that refer to any view in the subtree of the view you are removing.
    /// Never invoke this method during display.
    /// 
    func removeFromSuperview() {
    }

    // MARK: - Responding to View-Related Notifications

    /// Overridden by subclasses to perform additional actions when subviews are added to the view.
    /// 
    /// This method is invoked by ``addSubview(_:)``.
    /// - Parameter subview: The view that was added as a subview.
    func didAddSubview(_ subview: HostingView) { 
    }

    /// Informs the view that its superview has changed (possibly to nil).
    /// 
    /// The default implementation does nothing; subclasses can override this method to perform whatever actions are necessary.
    func viewDidMoveToSuperview() { 
    }

    /// The default implementation does nothing; subclasses can override this method to perform whatever actions are necessary.
    /// 
    /// If the view’s ``window`` property is nil, that result signifies that the view was removed from its window and does not currently reside in any window.
    func viewDidMoveToWindow() { 
    }

    /// Informs the view that its superview is about to change to the specified superview (which may be nil).
    /// 
    /// Subclasses can override this method to perform whatever actions are necessary.
    /// - Parameter newSuperview:A view object that will be the new superview of the view.
    func viewWillMove(toSuperview newSuperview: HostingView?) { 
    }

    /// Informs the view that it’s being added to the view hierarchy of the specified window object (which may be nil).
    /// 
    /// 
    /// OpenSwiftUI calls this method when the window of a view changes. 
    /// It also calls it in cases where a view stays in the same window but its position in its view hierarchy changes. 
    /// The view that moved also calls this method on all of its subviews, giving each of them a chance to respond to the change.
    /// 
    /// Subclasses can override this method to perform whatever actions are necessary. 
    /// For example, when a window is deallocated, you can use this method to remove notification observers and bindings associated with the view.
    /// 
    /// When a window is deallocated, OpenSwiftUI calls this method for each view in the window, passing nil for the newWindow parameter. 
    /// OpenSwiftUI does not necessarily call this method when closing a window, though. 
    /// Closing a window usually just hides the window. 
    /// Closed windows are deallocated only if their ``isReleasedWhenClosed`` method returns ``true``.
    /// - Parameter newWindow: The window object that will be at the root of the view’s new view hierarchy. If the view is being removed from a window and there is no new window, this parameter is nil.
    func viewWillMove(toWindow: HostingView?) { 
    }

    /// Overridden by subclasses to perform additional actions before subviews are removed from the view.
    /// 
    /// This method is invoked when subview receives a ``removeFromSuperview()`` message or subview is removed from the view due to it being added to another view with ``addSubview(_:)``.
    /// - Parameter subview: The subview that will be removed.
    func willRemoveSubview(_ subview: HostingView) { 
    }

    // MARK: - Identifying Views by Tag
    
    /// Returns the view’s nearest descendant (including itself) with a specific tag, or nil if no subview has that tag.
    /// 
    /// - Parameter tag: An identifier associated with a view object.
    func viewWithTag(_ tag: String) -> HostingView? {
        nil
    }

    /// The view’s tag, which is a string that you use to identify the view within your app.
    var tag: String? = nil

    // MARK: - Modifying the Frame Rectangle

    /// The view’s frame rectangle, which defines its position and size in its superview’s coordinate system.
    var frame: Rect3D

    // MARK: - Modifying the Bounds Rectangle

    /// The view’s bounds rectangle, which expresses its location and size in its own coordinate system.
    var bounds: Rect3D = .zero

    // MARK: - Drawing the View’s Content

    @MainActor func update() {
    }

    /// Overridden by subclasses to draw the view’s image within the specified rectangle.
    /// 
    /// - Parameter dirtyRect: A rectangle defining the portion of the view that requires redrawing. 
    ///                        This rectangle usually represents the portion of the view that requires updating. 
    ///                        When responsive scrolling is enabled, this rectangle can also represent a nonvisible portion of the view that OpenSwiftUI wants to cache.
    @MainActor func draw(_ dirtyRect: Rect3D) {
    }

    // MARK: - Invalidating the View’s Content

    /// A Boolean value that determines whether the view needs to be redrawn before being displayed.
    var needsDisplay: Bool = true

    /// Displays the view and all its subviews if possible
    /// 
    /// If the view isn’t opaque, this method backs up the view hierarchy to the first opaque ancestor, calculates the portion of the opaque ancestor covered by the view, and begins displaying from there.
    @MainActor func display() {
        guard needsDisplay else {
            return
        }

        needsDisplay = false
    }
}