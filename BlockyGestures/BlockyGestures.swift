//
//  BlockyGestures.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/27/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

typealias Store = GestureRecognizerClosureStore

public protocol Blocky: class {
    @discardableResult func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> ()) -> Self
    
    @discardableResult func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> ()) -> Self
}

extension UIGestureRecognizer: Blocky {
    public func performing(when state: UIGestureRecognizerState, _ action: @escaping () -> Void) -> Self {
        return performing(when: [state], action)
    }

    public func performing(when states: [UIGestureRecognizerState], _ action: @escaping () -> Void) -> Self {
        for state in states {
            Store.set(gesture: self, state: state, action)
        }
        addTarget(self, action: #selector(recognized))
        return self
    }

    @objc public func recognized(gesture: UIGestureRecognizer) {
        Store.get(gesture, state: gesture.state)?()
    }
}



extension UITapGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UITapGestureRecognizer {
        return performing(when: .ended, action)
    }
}

extension UIPinchGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UIPinchGestureRecognizer {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UIRotationGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UIRotationGestureRecognizer {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UISwipeGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UISwipeGestureRecognizer {
        return performing(when: [.ended], action)
    }
}

extension UIPanGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UIPanGestureRecognizer {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UILongPressGestureRecognizer {
    @discardableResult func performing(_ action: @escaping () -> Void) -> UILongPressGestureRecognizer {
        return performing(when: [.began, .changed, .ended], action)
    }
}
