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
    @IBOutlet weak var img: UIImageView!
    
    var fruit = FruitCollection()
    var currentFruit: Fruit! = FruitCollection.currentFruit()
    var currentImage: UIImage!
    var numFruits = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let i = UserDefaults.standard.integer(forKey: "currentIndex") as Int? {
            FruitCollection.setCurrentIndex(to: i)
        }
        currentFruit = FruitCollection.currentFruit()
        currentImage = UIImage(named: currentFruit.fruitImageName)!
        img.image = currentImage
    }
    
    @IBAction func onLikePressed(_ sender: Any) {
        FruitCollection.collection[FruitCollection.getCurrentIndex()].likes += 1
        likes.text = String(FruitCollection.collection[FruitCollection.getCurrentIndex()].likes)
    }
        
    @IBAction func onDislikePressed(_ sender: Any) {
        FruitCollection.collection[FruitCollection.getCurrentIndex()].disLikes += 1
        dislikes.text = String(FruitCollection.collection[FruitCollection.getCurrentIndex()].disLikes)
    }
    
    @IBAction func onNextPressed(_ sender: Any) {
        FruitCollection.setCurrentIndex(to: FruitCollection.getCurrentIndex() + 1)
        
        if FruitCollection.getCurrentIndex() > (numFruits - 1) {
            FruitCollection.setCurrentIndex(to: 0)
        }
        
        currentFruit = FruitCollection.currentFruit()
        currentImage = UIImage(named: currentFruit.fruitImageName)!
        img.image = currentImage
        likes.text = String(currentFruit.likes)
        dislikes.text = String(currentFruit.disLikes)
        
    }
}

