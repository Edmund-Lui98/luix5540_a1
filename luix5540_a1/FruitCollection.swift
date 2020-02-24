//
//  FruitCollection.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-29.
//  Copyright © 2020 wlu. All rights reserved.
//

//import Foundation
//
//struct FruitCollection{
//    static var collection = [Fruit]() // a collection is an array of fruits
//    static var current:Int = 0 // the current fruit in the collection (to be shown in the scene)
//    init(){ // init is automatically called when you make an instance of the FruitCollection
//            // You implement this function
//        addFruit(fruitName: "Apple", fruitImageName: "apple.png")
//        addFruit(fruitName: "Banana", fruitImageName: "banana.png")
//        addFruit(fruitName: "Mango", fruitImageName: "mango.png")
//        addFruit(fruitName: "Watermelon", fruitImageName: "watermelon.png")
//            // Make a Fruit and append it to your FruitCollection
//            // repeat as many times as you need, your collection should contain at least four fruits
//    } //init
//
//    func addFruit(fruitName:String, fruitImageName: String) {
//        let fruit = Fruit(fruitName: fruitName, fruitImageName: fruitImageName)
//        FruitCollection.collection.append(fruit)
//    }
//
//    func deleteFruit(fruitIndex: Int) {
//        FruitCollection.collection.remove(at: fruitIndex)
//    }
//
//    // return the current fruit
//    static func currentFruit() -> Fruit {
//        let fruit = FruitCollection.collection[FruitCollection.current]
//        return fruit
//    }
//
//    // return the index of the current fruit
//    static func setCurrentIndex(to index: Int) { // you may need this function for relaunching the app
//        FruitCollection.current = index
//        // return the index of the current fruit in the collection
//    }
//
//    static func getCurrentIndex() -> Int {
//            return FruitCollection.current
//    }// getCurrentIndex
//
//    // other helper functions you may need when relaunching the app
//} // FruitCollection


 import UIKit
 class FruitCollection: NSObject, NSCoding {
    static var collection = [Fruit]() // a collection is an array of fruits
    static var current:Int = 0 // the current fruit in the collection (to be shown in the scene)
    static var numOfFruits:Int = 0
    let collectionKey = "collectionKey"
    let currentKey = "currentKey"
    // MARK: - NSCoding methods
    override init(){
        super.init()
        
        //TODO: load fruit colleciton
    }
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        FruitCollection.collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
        FruitCollection.current = (decoder.decodeInteger(forKey: currentKey))
    }
    func encode(with acoder: NSCoder) {
        acoder.encode(FruitCollection.collection, forKey: collectionKey)
        acoder.encode(FruitCollection.current, forKey: currentKey)
    }
    // Mark: - Helpers
    
    func addFruit(fruitName:String, fruitImageName: UIImage) {
        if let fruit = Fruit(fruitName: fruitName, fruitImage: fruitImageName, likes: 0, disLikes: 0) {
            FruitCollection.collection.append(fruit)
        }
        FruitCollection.numOfFruits += 1
        //TODO: save fruits to archive
    }
    
    func deleteFruit(fruitIndex: Int) {
        
        FruitCollection.numOfFruits -= 1
        let x = FruitCollection.collection.remove(at: FruitCollection.current)
        NSKeyedArchiver.archiveRootObject(FruitCollection.collection, toFile: Fruit.ArchiveURL.path)
        //TODO: save new fruit collection to archive (writes over the old collection stored) 
    }
    
    func saveFruits() {
        NSKeyedArchiver.archiveRootObject(FruitCollection.collection, toFile: Fruit.ArchiveURL.path)
    }
    func loadFruits() -> [Fruit] {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Fruit.ArchiveURL.path) as? [Fruit])!
    }
    
    func getCurrentIndex() -> Int {
        return FruitCollection.current
    }// getCurrentIndex
    
    // return the current fruit
    func currentFruit() -> Fruit {
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit
    }
    func numFruits() -> Int {
        return FruitCollection.numOfFruits 
    }
    // return the index of the current fruit
    func setCurrentIndex(to index: Int) { // you may need this function for relaunching the app
        FruitCollection.current = index
        // return the index of the current fruit in the collection
    }
    func addLike(Fruit: Fruit) {
        FruitCollection.collection[FruitCollection.current].likes += 1
    }
    func addDislike(Fruit: Fruit) {
        FruitCollection.collection[FruitCollection.current].disLikes += 1
    }
}
