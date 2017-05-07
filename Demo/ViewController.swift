//
//  ViewController.swift
//  Demo
//
//  Created by Zsolt Kovacs on 5/2/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import UIKit
import BlockyGestures

class ViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var gestureLabel: UILabel!

    private var regularGestures: [UIGestureRecognizer]!
    private var customGestures: [UIGestureRecognizer]!

    private var index = 0
    private var regularCounter = 0 {
        didSet {
            topLabel.text = "\(regularCounter)"
        }
    }

    private var customCounter = 0 {
        didSet {
            bottomLabel.text = "\(customCounter)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        regularGestures = [
            UITapGestureRecognizer(target: self, action: #selector(action)),
            UIPinchGestureRecognizer(target: self, action: #selector(action)),
            UIRotationGestureRecognizer(target: self, action: #selector(action)),
            UISwipeGestureRecognizer(target: self, action: #selector(action)),
            UIPanGestureRecognizer(target: self, action: #selector(action)),
            UILongPressGestureRecognizer(target: self, action: #selector(action))
        ]

        customGestures = [
            UITapGestureRecognizer(),
            UIPinchGestureRecognizer(),
            UIRotationGestureRecognizer(),
            UISwipeGestureRecognizer(),
            UIPanGestureRecognizer(),
            UILongPressGestureRecognizer()
        ]

        start()
    }

    @IBAction func nextTapped(_ sender: Any) {
        let regularGesture = regularGestures[index]
        let customGesture = customGestures[index]

        topView.removeGestureRecognizer(regularGesture)
        bottomView.removeGestureRecognizer(customGesture)

        index += 1
        start()
    }

    private func start() {
        regularCounter = 0
        customCounter = 0

        let regularGesture = regularGestures[index]
        let customGesture = customGestures[index].performing { [weak self] in
            self?.customCounter += 1
        }

        gestureLabel.text = String(describing: type(of: regularGesture))

        topView.addGestureRecognizer(regularGesture)
        bottomView.addGestureRecognizer(customGesture)
    }

    @objc func action(sender: UIGestureRecognizer) {
        regularCounter += 1
    }
}

