//
//  BlockyGestures.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/27/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import Foundation

import UIKit
import UIKit.UIGestureRecognizerSubclass

public protocol Blocky: class {
    func performing(_ action: @escaping () -> Void) -> Self
    
    func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> Void) -> Self
    
    func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> Void) -> Self
}

var AssociatedObjectHandle: UInt8 = 0
extension Blocky {
    public typealias BlockStore = ClosureStore<UIGestureRecognizerState>
    public var actions: BlockStore {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? BlockStore ?? BlockStore()
        }
        set {
            return objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIGestureRecognizer: Blocky {
    public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: .began, action)
    }

    public func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> Void) -> Self {
        return performing(when: [state], action)
    }

    public func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> Void) -> Self {
        for state in states {
            actions.set(state, action)
        }
        return self
    }
}

extension UITapGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UIPinchGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UIRotationGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UISwipeGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UIPanGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UIScreenEdgePanGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}

extension UILongPressGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                action()
            }
        }
    }
}
