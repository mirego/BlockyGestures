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
                let gesture = UIGestureRecognizer()
                let state: UIGestureRecognizerState = .began
                Store.set(gesture: gesture, state: state) {}

                let closure = GestureRecognizerClosureStore.get(gesture, state: state)
                expect(closure).notTo(beNil())

                Store.empty()
            }

            it("can run retrieved closures") {
                let gesture = UIGestureRecognizer()
                let state: UIGestureRecognizerState = .began

                var executed = false
                GestureRecognizerClosureStore.set(gesture: gesture, state: state, {
                    executed = true
                })

                if let closure = GestureRecognizerClosureStore.get(gesture, state: state) {
                    closure()
                }
                expect(executed).to(beTrue())

                Store.empty()
            }

            it("can delete closures") {
                let gesture = UIGestureRecognizer()
                let state: UIGestureRecognizerState = .began

                Store.set(gesture: gesture, state: state, {})
                Store.remove(gesture: gesture, state: state)

                var removed = false
                if Store.get(gesture, state: state) == nil {
                    removed = true
                }

                expect(removed).to(beTrue())

                Store.empty()
            }

            it("does not remove other elements when one is removed") {
                let firstGesture = UIGestureRecognizer()
                let firstState: UIGestureRecognizerState = .began

                let secondGesture = UIGestureRecognizer()
                let secondState: UIGestureRecognizerState = .possible

                Store.set(gesture: firstGesture, state: firstState, {} )
                Store.set(gesture: secondGesture, state: secondState, {} )

                Store.remove(gesture: firstGesture, state: firstState)

                var correctlyRemoved = false
                if Store.get(firstGesture, state: firstState) == nil && Store.get(secondGesture, state: secondState) != nil {
                    correctlyRemoved = true
                }
                
                expect(correctlyRemoved).to(beTrue())
            }

            it("to be able to empty all closures") {
                let gesture = UIGestureRecognizer()
                let firstState: UIGestureRecognizerState = .began
                let secondState: UIGestureRecognizerState = .possible

                Store.set(gesture: gesture, state: firstState, {} )
                Store.set(gesture: gesture, state: secondState, {} )

                Store.empty()

                var removed = false
                if Store.get(gesture, state: firstState) == nil && Store.get(gesture, state: secondState) == nil {
                    removed = true
                }

                expect(removed).to(beTrue())
            }
        }
    }
}
