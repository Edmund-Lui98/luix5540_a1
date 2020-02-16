//
//  DeleteViewController.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-02-15.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class DeleteViewController: UIViewController {
    
    @IBOutlet weak var fruitName: UILabel!
    var fruit = FruitCollection()
    var currentFruit: Fruit! = FruitCollection.currentFruit()
    var currentImage: UIImage!
    var numFruits = 4
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentFruit = FruitCollection.currentFruit()
        currentImage = UIImage(named: currentFruit.fruitImageName)!
        img.image = currentImage
        fruitName.text = currentFruit.fruitName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        FruitCollection.setCurrentIndex(to: FruitCollection.getCurrentIndex() + 1)
        
        if FruitCollection.getCurrentIndex() > (numFruits - 1) {
            FruitCollection.setCurrentIndex(to: 0)
        }
        
        currentFruit = FruitCollection.currentFruit()
        currentImage = UIImage(named: currentFruit.fruitImageName)!
        img.image = currentImage
    }
    
    @IBAction func deletePressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Deleted", message: "The fruit has been deleted", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
