//
//  ViewController.swift
//  Demo
//
//  Created by Zsolt Kovacs on 5/2/17.
//  Copyright © 2017 iOSmith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapAgain = UIPanGestureRecognizer()
        tapAgain.performing {
            print("\(tapAgain.state.rawValue): Hi")
        }
        view.addGestureRecognizer(tapAgain)
    }

    @objc func printThis(sender: UIGestureRecognizer) {
        print("\(sender.state.rawValue): Hi")
    }

    func updateText(fromGesture gesture: UIGestureRecognizer) {
        label.text = {
            switch gesture {
            case is UITapGestureRecognizer:
                return "Tap"
            default:
                return "Undefined"
            }
        }()
    }
}

