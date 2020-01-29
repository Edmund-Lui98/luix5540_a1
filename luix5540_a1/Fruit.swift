//
//  Fruit.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-01-29.
//  Copyright © 2020 wlu. All rights reserved.
//

import Foundation


struct Fruit {
    let fruitImageName:String
    let fruitName:String
    var likes = 0
    var disLikes = 0
    init(fruitName: String, fruitImageName: String){
        self.fruitImageName = fruitImageName
        self.fruitName = fruitName
    }
}
