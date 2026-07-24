//
// Animatable.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Sep 18, 2024.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

import Foundation

/// A type that describes how to animate a property of a view.
public protocol Animatable {

    // MARK: - Animating data

    /// The type defining the data to animate.
    associatedtype AnimatableData : VectorArithmetic

    /// The data to animate.
    var animatableData: Self.AnimatableData { get set }
}

extension Animatable {
    public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type where T : VectorArithmetic {
        T.self
    }

    public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.AnimatableData.Type where T : Animatable {
        T.AnimatableData.self
    }

    public static subscript<T>(_animatableType _: KeyPath<Self, T>) -> T.Type {
        T.self
    }

    public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get { self[keyPath: keyPath] }
        set { self[keyPath: keyPath] = newValue }
    }

    public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get { self[keyPath: keyPath].animatableData }
        set { self[keyPath: keyPath].animatableData = newValue }
    }

    public subscript<T>(_animatableValue keyPath: WritableKeyPath<Self, T>) -> EmptyAnimatableData {
        get { .zero }
        nonmutating set { }
    }

    public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T where T : VectorArithmetic {
        get { self[keyPath: keyPath] }
        nonmutating set { self[keyPath: keyPath] = newValue }
    }

    public subscript<T>(_animatableValue keyPath: ReferenceWritableKeyPath<Self, T>) -> T.AnimatableData where T : Animatable {
        get { self[keyPath: keyPath].animatableData }
        nonmutating set { self[keyPath: keyPath].animatableData = newValue }
    }
}
