//
//  ViewController.swift
//  FoodTracker
//
//  Created by Łukasz Marczak on 11.08.2016.
//  Copyright © 2016 Łukasz Marczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!

    @IBOutlet weak var labelRef: UILabel!
    
    @IBOutlet weak var textViewRef: UITextField!
    
    @IBAction func onButtonClick(sender: AnyObject) {
        print("onButtonClick");
        labelRef!.text = textViewRef!.text;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textViewRef.delegate = self;
        setupImageClickListener();
    }
    
    func setupImageClickListener() {
        let tapGestureRecognizer
            = UITapGestureRecognizer(target:self, action:#selector(ViewController.selectImageFromPhotoLibrary(_:)));
        photoImageView.userInteractionEnabled = true
        photoImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        print("selectImageFromPhotoLibrary");
        textViewRef?.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("imagePickerController");
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    func textFieldDidEndEditing(textField: UITextField){
        print("textFieldDidEndEditing: " + String(textViewRef.text));
        labelRef.text = textViewRef.text;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("textFieldShouldReturn");
        textViewRef?.resignFirstResponder();
        return true
    }
}

