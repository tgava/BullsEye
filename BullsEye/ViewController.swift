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
    // Specifying INT is optional since SWIFT can infer the type
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // Do any additional setup after loading the view, typically from a nib.
        //e.g getting the initial value of slider and storing in currentValue
        currentValue = lroundf(slider.value)
         // as well as dressing up the slider UI elements
         
        //and the need for a random target value
        
        targetValue = 1 + Int(arc4random_uniform(100))
 */
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighLighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighLighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {let trackLeftResizable =              trackLeftImage.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
            }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {let trackRightResizable =              trackRightImage.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }
        startNewGame()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
    @IBAction func showAlert() {
        
        //calculate the difference between slider value and target value
        // ALGORITHM 3
        let difference = abs(targetValue - currentValue)
        
        /* ALGORITHM 2
 
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = difference * -1
        }
         */
        /* ALGORITHM 1 
         var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        } else if targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        */
        var points = 100 - difference
       
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close!.."
        }
         score += points
        
        // let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" + "\nThe difference is: \(difference)" + "\nYou scored : \(points)"
        
        let message = "You scored : \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action =  UIAlertAction(title: "OK", style: .default, handler: {action in
            self.startNewRound()
            self.updateLabels()}
            )
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        //startNewRound()
        //updateLabels()
        
    }
    //function for slider moved event:
    @IBAction func sliderMoved(slider: UISlider) {
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
        //print("The value of the slider is now: \(currentValue)")
    }
    func startNewRound() {
        round += 1
    targetValue = 1 + Int(arc4random_uniform(100))
    currentValue = 50
    slider.value = Float(currentValue)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
    targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

