//
//  PressAndHoldGestureRecognizerTests.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/29/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import Quick
import Nimble
@testable import BlockyGestures

//class PressAndHoldGestureRecognizerTests: QuickSpec {
//    override func spec() {
//        describe("PressAndHoldGestureRecognizer") {
//            it("Executes the closure the correct number of times") {
//                var executionCount = 0
//                let gesture = PressAndHoldGestureRecognizer(delay: 0.1).performing {
//                    executionCount += 1
//                }
//                gesture.state = .began
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                    gesture.reset()
//                })
//
//                expect(executionCount).toEventually(equal(1), timeout: 0.1, pollInterval: 0.05)
//                expect(executionCount).toEventually(equal(2), timeout: 0.2, pollInterval: 0.05)
//                expect(executionCount).toEventually(equal(3), timeout: 0.3, pollInterval: 0.05)
//                expect(executionCount).toEventually(equal(4), timeout: 0.4, pollInterval: 0.05)
//                expect(executionCount).toEventually(equal(5), timeout: 0.5, pollInterval: 0.05)
//            }
//        }
//    }
//}
