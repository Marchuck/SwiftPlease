//
//  ViewController.swift
//  FoodTracker
//
//  Created by Łukasz Marczak on 11.08.2016.
//  Copyright © 2016 Łukasz Marczak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var labelRef: UILabel!
    
    @IBOutlet weak var textViewRef: UITextField!
    
    
    @IBAction func onButtonClick(sender: AnyObject) {
        labelRef?.text =textViewRef?.text;
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

