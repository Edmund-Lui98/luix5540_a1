//
//  ViewController.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-09.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {
    
    @IBOutlet weak var dislikes: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var fruitName: UILabel!
    
//    var fruit = FruitCollection()
//    var currentFruit: Fruit! = FruitCollection.currentFruit()
//    var currentImage: UIImage!
//    var numFruits = 4
    
    var fruits = FruitCollection()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        if let i = UserDefaults.standard.integer(forKey: "currentIndex") as Int? {
//            FruitCollection.setCurrentIndex(to: i)
//        }
//        currentFruit = FruitCollection.currentFruit()
//        currentImage = UIImage(named: currentFruit.fruitImageName)!
//        fruitName.text = currentFruit.fruitName
//        img.image = currentImage
        
        // Load any saved meals, otherwise load sample data.
        
        let tempFruits = fruits.loadFruits()
        for fruit in tempFruits {
            fruits.addFruit(fruitName: fruit.fruitName, fruitImageName: fruit.fruitImage)
        }
        
        if fruits.numFruits() == 0 {
            loadSampleFruits()
        }
        
        let fruit = fruits.currentFruit
        
        img.image = fruit().fruitImage
        likes.text = String(fruit().likes)
        dislikes.text = String(fruit().disLikes)
        fruitName.text = fruit().fruitName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let tempFruits = fruits.loadFruits()
        for fruit in tempFruits {
            fruits.addFruit(fruitName: fruit.fruitName, fruitImageName: fruit.fruitImage)
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        fruits.saveFruits()
        
    }
    
    private func loadSampleFruits() {
        
        let photo1 = UIImage(named: "apple.png")
        let photo2 = UIImage(named: "banana.png")
        let photo3 = UIImage(named: "mango.png")
        let photo4 = UIImage(named: "watermelon.png")

//
//        guard let fruit1 = Fruit(fruitName: "Apple", fruitImage: photo1!, likes: 0, disLikes: 0) else {
//            fatalError("Unable to instantiate fruit")
//        }
//        guard let fruit2 = Fruit(fruitName: "Banana", fruitImage: photo2!, likes: 0, disLikes: 0) else {
//            fatalError("Unable to instantiate fruit")
//        }
//        guard let fruit3 = Fruit(fruitName: "Mango", fruitImage: photo3!, likes: 0, disLikes: 0) else {
//            fatalError("Unable to instantiate fruit")
//        }
//        guard let fruit4 = Fruit(fruitName: "Watermelon", fruitImage: photo4!, likes: 0, disLikes: 0) else {
//            fatalError("Unable to instantiate fruit")
//        }

        fruits.addFruit(fruitName: "Apple", fruitImageName: photo1!)
        fruits.addFruit(fruitName: "Banana", fruitImageName: photo2!)
        fruits.addFruit(fruitName: "Mango", fruitImageName: photo3!)
        fruits.addFruit(fruitName: "Watermelon", fruitImageName: photo4!)
        
    }
    
    
    @IBAction func onLikePressed(_ sender: Any) {
//        FruitCollection.collection[FruitCollection.getCurrentIndex()].likes += 1
//        likes.text = String(FruitCollection.collection[FruitCollection.getCurrentIndex()].likes)
        
        let fruit = fruits.currentFruit
        
        fruits.addLike(Fruit: fruit())
        likes.text = String(fruit().likes)
        
    }
        
    @IBAction func onDislikePressed(_ sender: Any) {
//        FruitCollection.collection[FruitCollection.getCurrentIndex()].disLikes += 1
//        dislikes.text = String(FruitCollection.collection[FruitCollection.getCurrentIndex()].disLikes)
        
        let fruit = fruits.currentFruit
        
        fruits.addDislike(Fruit: fruit())
        dislikes.text = String(fruit().disLikes)
        
    }
    
    @IBAction func onNextPressed(_ sender: Any) {
//        FruitCollection.setCurrentIndex(to: FruitCollection.getCurrentIndex() + 1)
//
//        if FruitCollection.getCurrentIndex() > (numFruits - 1) {
//            FruitCollection.setCurrentIndex(to: 0)
//        }
//
//        currentFruit = FruitCollection.currentFruit()
//        currentImage = UIImage(named: currentFruit.fruitImageName)!
//        img.image = currentImage
//        fruitName.text = currentFruit.fruitName
//        likes.text = String(currentFruit.likes)
//        dislikes.text = String(currentFruit.disLikes)
        if fruits.getCurrentIndex() < fruits.numFruits()-1 {
            fruits.setCurrentIndex(to: fruits.getCurrentIndex()+1)
        } else {
            fruits.setCurrentIndex(to: 0)
        }
        let fruit = fruits.currentFruit
        
        img.image = fruit().fruitImage
        likes.text = String(fruit().likes)
        dislikes.text = String(fruit().disLikes)
        fruitName.text = fruit().fruitName
    }
}

