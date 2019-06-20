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
    @discardableResult func performing( _ action: @escaping () -> ()) -> Self
    
    @discardableResult func performing(when state: UIGestureRecognizer.State, _ action: @escaping () -> ()) -> Self
    
    @discardableResult func performing(when states: [UIGestureRecognizer.State], _ action: @escaping () -> ()) -> Self
}

extension UIGestureRecognizer: Blocky {
    @objc
    public func performing(_ action: @escaping () -> ()) -> Self {
        return performing(when: .began, action)
    }
    
    @objc
    public func performing(when state: UIGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        return performing(when: [state], action)
    }
    
    public func performing(when states: [UIGestureRecognizer.State], _ action: @escaping () -> Void) -> Self {
        for state in states {
            Store.set(gesture: self, state: state, action)
        }
        addTarget(self, action: #selector(recognized))
        return self
    }
    
    @objc
    public func recognized(gesture: UIGestureRecognizer) {
        Store.get(gesture, state: gesture.state)?()
    }
}



extension UITapGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: .ended, action)
    }
}

extension UIPinchGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UIRotationGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UISwipeGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: [.ended], action)
    }
}

extension UIPanGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: [.began, .changed, .ended], action)
    }
}

extension UILongPressGestureRecognizer {
    @objc
    @discardableResult override public func performing(_ action: @escaping () -> Void) -> Self {
        return performing(when: [.began, .changed, .ended], action)
    }
}
