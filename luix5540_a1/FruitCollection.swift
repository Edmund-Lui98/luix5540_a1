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
            // Make a Fruit and append it to your FruitCollection
            // repeat as many times as you need, your collection should contain at least four fruits
    } //init

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

