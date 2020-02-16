//
//  FruitCollection.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-29.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation

struct FruitCollection{
    static var collection = [Fruit]() // a collection is an array of fruits
    static var current:Int = 0 // the current fruit in the collection (to be shown in the scene)
    init(){ // init is automatically called when you make an instance of the FruitCollection
            // You implement this function
        addFruit(fruitName: "Apple", fruitImageName: "apple.png")
        addFruit(fruitName: "Banana", fruitImageName: "banana.png")
        addFruit(fruitName: "Mango", fruitImageName: "mango.png")
        addFruit(fruitName: "Watermelon", fruitImageName: "watermelon.png")
            // Make a Fruit and append it to your FruitCollection
            // repeat as many times as you need, your collection should contain at least four fruits
    } //init

    func addFruit(fruitName:String, fruitImageName: String) {
        let fruit = Fruit(fruitName: fruitName, fruitImageName: fruitImageName)
        FruitCollection.collection.append(fruit)
    }

    func deleteFruit(fruitIndex: Int) {
        FruitCollection.collection.remove(at: fruitIndex)
    }

    // return the current fruit
    static func currentFruit() -> Fruit {
        let fruit = FruitCollection.collection[FruitCollection.current]
        return fruit
    }

    // return the index of the current fruit
    static func setCurrentIndex(to index: Int) { // you may need this function for relaunching the app
        FruitCollection.current = index
        // return the index of the current fruit in the collection
    }

    static func getCurrentIndex() -> Int {
            return FruitCollection.current
    }// getCurrentIndex

    // other helper functions you may need when relaunching the app
} // FruitCollection


// import UIKit
// class FruitCollection: NSObject, NSCoding {
//    var collection = [Fruit]() // a collection is an array of fruits
//    var current:Int = 0 // the current fruit in the collection (to be shown in the scene)
//    let collectionKey = "collectionKey"
//    let currentKey = "currentKey"
//    // MARK: - NSCoding methods
//    override init(){
//        super.init()
//    }
//    required convenience init?(coder decoder: NSCoder) {
//        self.init()
//        collection = (decoder.decodeObject(forKey: collectionKey) as? [Fruit])!
//        current = (decoder.decodeInteger(forKey: currentKey))
//    }
//    func encode(with acoder: NSCoder) {
//        acoder.encode(collection, forKey: collectionKey)
//        acoder.encode(current, forKey: currentKey)
//    }
//    // Mark: - Helpers
//}
