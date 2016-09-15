//
//  ViewController.swift
//  BullsEye
//
//  Created by Tichafa Gava on 13/09/2016.
//  Copyright © 2016 Tichafa Gava - Ketts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // declare variable for storing the value of the slider
    var currentValue: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, good friends", message: "This is my Bulls eye app", preferredStyle: .alert)
        let action =  UIAlertAction(title: "Awesome!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    //function for slider moved event:
    @IBAction func sliderMoved(slider: UISlider) {
        //print("The value of the slider is now: \(slider.value)")
        currentValue = Int(slider.value)
        print("The value of the slider is now: \(currentValue)")
    }
}

