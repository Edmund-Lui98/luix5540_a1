//
//  ViewController.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-09.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dislikes: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet var img: UIImageView!
    
    var count = 1
    
    var likeApple = 0
    var dislikeApple = 0
    var likeBanana = 0
    var dislikeBanana = 0
    var likeWatermelon = 0
    var dislikeWatermelon = 0
    var likeMango = 0
    var dislikeMango = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLikePressed(_ sender: Any) {
        if (count == 1) {
            likeApple += 1
            likes.text = "\(likeApple)"

        } else if (count == 2) {
            likeBanana += 1
            likes.text = "\(likeBanana)"

        } else if (count == 3) {
            likeWatermelon += 1
            likes.text = "\(likeWatermelon)"

        } else if (count == 4) {
            likeMango += 1
            likes.text = "\(likeMango)"

        }
        print("like pressed")
    }
    
    @IBAction func onDislikePressed(_ sender: Any) {
        if (count == 1) {
            dislikeApple += 1
            dislikes.text = "\(dislikeApple)"

        } else if (count == 2) {
            dislikeBanana += 1
            dislikes.text = "\(dislikeBanana)"

        } else if (count == 3) {
            dislikeWatermelon += 1
            dislikes.text = "\(dislikeWatermelon)"

        } else if (count == 4) {
            dislikeMango += 1
            dislikes.text = "\(dislikeMango)"

        }
        print("dislike pressed")
    }
    
    @IBAction func onNextPressed(_ sender: Any) {
        count += 1
        if (count == 5) {
            count = 1
        }
        
        if (count == 1) {
            img.image = UIImage(named: "apple")
            likes.text = "\(likeApple)"
            dislikes.text = "\(dislikeApple)"
        } else if (count == 2) {
            img.image = UIImage(named: "banana")
            likes.text = "\(likeBanana)"
            dislikes.text = "\(dislikeBanana)"
        } else if (count == 3) {
            img.image = UIImage(named: "watermelon")
            likes.text = "\(likeWatermelon)"
            dislikes.text = "\(dislikeWatermelon)"
        } else if (count == 4) {
            img.image = UIImage(named: "mango")
            likes.text = "\(likeMango)"
            dislikes.text = "\(dislikeMango)"
        }
        print("next pressed")
    }
}

