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

typealias Store = GestureRecognizerClosureStore

public protocol Blocky: class {
    func performing(_ action: @escaping () -> Void) -> Self
    
    func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> Void) -> Self
    
    func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> Void) -> Self
}

extension UIGestureRecognizer: Blocky {
    public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: .possible, action)
    }

    public func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> Void) -> Self {
        return performing(when: [state], action)
    }

    public func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> Void) -> Self {
        for state in states {
            Store.set(gesture: self, state: state, action)
        }
        return self
    }
}

extension UITapGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UIPinchGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UIRotationGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UISwipeGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UIPanGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UIScreenEdgePanGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}

extension UILongPressGestureRecognizer {
    override open var state: UIGestureRecognizerState {
        didSet {
            if let action = Store.get(self, state: state) {
                action()
            }
        }
    }
}
