//
//  BlockyGesturesTests.swift
//  BlockyGesturesTests
//
//  Created by Zsolt Kovacs on 4/26/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import Quick
import Nimble
@testable import BlockyGestures

class BlockyGesturesTests: QuickSpec {
    override func spec() {
        describe("BlockyGesture") {
            it("Can can be created with a closure") {
                let gesture = UITapGestureRecognizer().performing { }
                expect(gesture).notTo(beNil())
            }

            it("Can run the closure on different gesture states") {
                let state: UIGestureRecognizerState = .ended
                var executed = false
                let gesture = UITapGestureRecognizer().performing(when: state, {
                    executed = true
                })

                gesture.state = state
                expect(executed).to(beTrue())
            }

            it("Won't run the closure on a different gesture state") {
                var executed = false
                let gesture = UITapGestureRecognizer().performing(when: .began, {
                    executed = true
                })

                gesture.state = .ended
                expect(executed).to(beFalse())
            }

            it("Can run same closure for multiple states") {
                var executionCount = 0
                let gesture = UITapGestureRecognizer().performing(when: [.began, .ended], { 
                    executionCount += 1
                })

                gesture.state = .began
                expect(executionCount).to(equal(1))

                gesture.state = .ended
                expect(executionCount).to(equal(2))
            }
        }

        describe("BlockGesture UITapGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UITapGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UIPinchGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UIPinchGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UIRotationGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UIRotationGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UISwipeGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UISwipeGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UIPanGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UIPanGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UIScreenEdgePanGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UIScreenEdgePanGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }

        describe("BlockGesture UILongPressGestureRecognizer") {
            it("Can execute the closure when the gesture began") {

                var executed = false
                let gesture = UILongPressGestureRecognizer().performing {
                    executed = true
                }

                gesture.state = .possible
                expect(executed).to(beTrue())
            }
        }
    }
}
