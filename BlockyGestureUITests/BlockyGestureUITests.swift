//
//  BlockyGestureUITests.swift
//  BlockyGestureUITests
//
//  Created by Zsolt Kovacs on 5/5/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import XCTest

class BlockyGestureUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    
    func testTapsAreIdentical() {
        let app = XCUIApplication()
        
        let nextElementsQuery = app.otherElements.containing(.button, identifier:"NEXT")
        let topView = nextElementsQuery.children(matching: .other).element(boundBy: 0)
        let bottomView = nextElementsQuery.children(matching: .other).element(boundBy: 1)

        let actionCount = 5
        for _ in 1...actionCount {
            topView.tap()
            bottomView.tap()
        }

        XCTAssert(topView.staticTexts["\(actionCount)"].exists)
        XCTAssert(bottomView.staticTexts["\(actionCount)"].exists)
    }
//
//    func testPinchesAreIdentical() {
//        let app = XCUIApplication()
//        app.buttons["NEXT"].tap()
//
//        let nextElementsQuery = app.otherElements.containing(.button, identifier:"NEXT")
//        let topView = nextElementsQuery.children(matching: .other).element(boundBy: 0)
//        let bottomView = nextElementsQuery.children(matching: .other).element(boundBy: 1)
//
//        let actionCount = 5
//        for _ in 1...actionCount {
//            let scale = CGFloat(arc4random_uniform(101)) / 50
//            let velocity = CGFloat(arc4random_uniform(50))
//            topView.pinch(withScale: scale, velocity: velocity)
//            bottomView.pinch(withScale: scale, velocity: velocity)
//        }
//
//        XCTAssert(topView.staticTexts["\(actionCount)"].exists)
//        XCTAssert(bottomView.staticTexts["\(actionCount)"].exists)
//    }

    func testSwipesAreIdentical() {
        let app = XCUIApplication()

        for _ in 1...3 {
            app.buttons["NEXT"].tap()
        }

        let nextElementsQuery = app.otherElements.containing(.button, identifier:"NEXT")
        let topView = nextElementsQuery.children(matching: .other).element(boundBy: 0)
        let bottomView = nextElementsQuery.children(matching: .other).element(boundBy: 1)

        for _ in 1...5 {
            topView.swipeRight()
            bottomView.swipeRight()
        }
    }

    func testLongPressesAreIdentical() {
        let app = XCUIApplication()

        for _ in 1...5 {
            app.buttons["NEXT"].tap()
        }

        let nextElementsQuery = app.otherElements.containing(.button, identifier:"NEXT")
        let topView = nextElementsQuery.children(matching: .other).element(boundBy: 0)
        let bottomView = nextElementsQuery.children(matching: .other).element(boundBy: 1)

        topView.press(forDuration: 0.5, thenDragTo: app.buttons["NEXT"])
        bottomView.press(forDuration: 0.5, thenDragTo: app.buttons["NEXT"])


    }
}
