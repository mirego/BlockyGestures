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

        let tap = UITapGestureRecognizer(target: self, action: #selector(printThis))
        let tapAgain = UITapGestureRecognizer()
        tapAgain.performing {
            print("Hi again...")
        }

//        tap.performing {
//            print("Hi")
//        }

        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(tapAgain)
    }

    @objc func printThis() {
        print("Hi")
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

