//
//  ClosureStoreTests.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/26/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import Quick
import Nimble
@testable import BlockyGestures

class ClosureStoreTests: QuickSpec {
    override func spec() {
        describe("ClosureStore") {
            it("can store and retrieve closures") {
                let state: UIGestureRecognizerState = .began
                var store = ClosureStore<UIGestureRecognizerState>()
                store.set(state, { })
                let closure = store.get(state)
                expect(closure).notTo(beNil())
            }

            it("can run retrieved closures") {
                let state: UIGestureRecognizerState = .began
                var store = ClosureStore<UIGestureRecognizerState>()

                var executed = false
                store.set(state, {
                    executed = true
                })

                if let closure = store.get(state) {
                    closure()
                }
                expect(executed).to(beTrue())
            }

            it("can delete closures") {
                let state: UIGestureRecognizerState = .began
                var store = ClosureStore<UIGestureRecognizerState>()

                store.set(state, { })
                store.remove(state)

                var removed = false
                if store.get(state) == nil {
                    removed = true
                }

                expect(removed).to(beTrue())
            }

            it("to be able to empty all closures") {
                let firstState: UIGestureRecognizerState = .began
                let secondState: UIGestureRecognizerState = .possible
                var store = ClosureStore<UIGestureRecognizerState>()

                store.set(firstState, { })
                store.set(secondState, { })

                store.empty()

                var removed = false
                if store.get(firstState) == nil && store.get(secondState) == nil {
                    removed = true
                }
                
                expect(removed).to(beTrue())
            }
        }
    }
}
