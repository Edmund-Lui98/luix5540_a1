//
//  ViewController.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-09.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLikePressed(_ sender: Any) {
        print("like pressed")
    }
    @IBAction func onDislikePressed(_ sender: Any) {
        print("dislike pressed")
    }
    @IBAction func onNextPressed(_ sender: Any) {
        print("next pressed")
    }
}

