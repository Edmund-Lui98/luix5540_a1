//
//  AddViewController.swift
//  luix5540_a1
//
//  Created by Prism Student on 2020-02-15.
//  Copyright © 2020 wlu. All rights reserved.
//

import UIKit

class AddViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var pickImage: UIImageView!
    @IBOutlet weak var fruitNameField: UITextField!
    
    var fruit: Fruit?
    
    @IBAction func tapped(_ sender: Any) {
        fruitNameField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.fruitNameField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func chooseLibrary(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
        //MARK: UIImagePickerControllerDelegate
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Local variable inserted by Swift 4.2 migrator.
            //let img = info[.originalImage] as? UIImage
            //pickImage.image = img
            
            let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
            
            //The info dictionary may contain multiple representations of the image. You want to use the original.
            guard let selectedImage = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage else {
               fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
                
            }
            
            info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)]
            
            // Set photoImageView to display the selected image.
            pickImage.image = selectedImage
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)

        }
    
    // Not important for us
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
        
    }
    
    
    @IBAction func AddFruitPressed(_ sender: Any) {
        
//        if (fruitNameField.text?.count ?? 0 > 0) {
//            
//            let alert = UIAlertController(title: "Fruit has been added", message: "The fruit '" + (fruitNameField.text ?? "") + "' has been added", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        } else {
//            let alert = UIAlertController(title: "No fruit added", message: "No fruit has been entered", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//        }
        
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
