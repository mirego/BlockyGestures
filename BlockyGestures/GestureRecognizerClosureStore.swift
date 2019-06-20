//
//  ClosureStore.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/26/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

fileprivate var storage = NSMapTable<UIGestureRecognizer, Wrapper<UIGestureRecognizer.State>>.weakToStrongObjects()

/// ClosureStore is a simple module for storing closures based on a Hashable Key. It essentially is a wrapper around a Dictionary, allowing for easier replacement
public class GestureRecognizerClosureStore {

    /// Method for retrieving a closure based on the specified key
    ///
    /// - Parameter key: Key the closure was set to
    /// - Returns: Closure, if exists
    public static func get(_ gesture: UIGestureRecognizer, state: UIGestureRecognizer.State) -> ( () -> Void )? {
        let wrapper = storage.object(forKey: gesture)
        return wrapper?[state]
    }


    /// Method for setting a closure for a key
    ///
    /// - Parameters:
    ///   - key: Key you want to set the closure to
    ///   - action: The closure you want to store
    public static func set(gesture: UIGestureRecognizer, state: UIGestureRecognizer.State, _ action: @escaping () -> Void) {
        if let wrapper = storage.object(forKey: gesture) {
            wrapper[state] = action
        } else {
            let wrapper = Wrapper<UIGestureRecognizer.State>()
            wrapper[state] = action
            storage.setObject(wrapper, forKey: gesture)
        }
    }

    /// Remove a stored closure based on a key
    ///
    /// - Parameter key: Key the closure was set to
    public static func remove(gesture: UIGestureRecognizer, state: UIGestureRecognizer.State) {
        guard let wrapper = storage.object(forKey: gesture) else {
            return
        }
        wrapper.remove(state)
    }

    public static func clearAll(gesture: UIGestureRecognizer) {
        storage.removeObject(forKey: gesture)
    }

    /// Remove all stored closures
    public static func empty() {
        storage.removeAllObjects()
    }
}

fileprivate class Wrapper<Key: Hashable>: Any {
    fileprivate var closures = [Key: () -> Void]()

    subscript(index: Key) -> (() -> Void)? {
        get {
            return closures[index]
        }
        set(newValue) {
            closures[index] = newValue
        }
    }

    public func remove(_ key: Key) {
        closures.removeValue(forKey: key)
    }
}
