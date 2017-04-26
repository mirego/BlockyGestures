//
//  PressAndHoldGestureRecognizer.swift
//  BlockyGestures
//
//  Created by Zsolt Kovacs on 4/29/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class PressAndHoldGestureRecognizer: UILongPressGestureRecognizer {
    var delay: TimeInterval
    private var timer: Timer?

    init(delay: TimeInterval) {
        self.delay = delay
        super.init(target: nil, action: nil)
    }

    override var state: UIGestureRecognizerState {
        didSet {
            if let action = actions.get(state) {
                if state == .began {
                    if #available(iOS 10.0, *) {
                        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: true, block: { _ in
                            action()
                        })
                    } else {
                        timer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(performAction), userInfo: nil, repeats: true)
                    }
                } else {
                    action()
                }
            }
        }
    }

    override func reset() {
        timer?.invalidate()
        timer = nil
        super.reset()
    }

    @objc func performAction() {
        if let action = self.actions.get(.began) {
            action()
        }
    }
    
}
