//
//  ClosureStore.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/26/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import Foundation

/// ClosureStore is a simple module for storing closures based on a Hashable Key. It essentially is a wrapper around a Dictionary, allowing for easier replacement
public struct ClosureStore<Key: Hashable> {
    private typealias Storage = [Key: () -> Void]
    private var storage = Storage()

    
    /// Method for retrieving a closure based on the specified key
    ///
    /// - Parameter key: Key the closure was set to
    /// - Returns: Closure, if exists
    public func get(_ key: Key) -> ( () -> Void )? {
        return storage[key]
    }


    /// Method for setting a closure for a key
    ///
    /// - Parameters:
    ///   - key: Key you want to set the closure to
    ///   - action: The closure you want to store
    mutating public func set(_ key: Key, _ action: @escaping () -> Void) {
        storage[key] = action
    }


    /// Remove a stored closure based on a key
    ///
    /// - Parameter key: Key the closure was set to
    mutating public func remove(_ key: Key) {
        storage.removeValue(forKey: key)
    }
    

    /// Remove all stored closures
    mutating public func empty() {
        storage.removeAll()
    }
}
