//
//  ViewController.swift
//  BullsEye
//
//  Created by Illy Sell on 23/06/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var valueOfSlider: Int = 0
  var targetValue: Int = 0
  var score = 0
  var rounds = 0
  
  @IBOutlet weak var randValue: UILabel!
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var scoreTotal: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
     //    when slider default value changed in Inspector -> avoid hardcoding
    valueOfSlider = Int(slider.value.rounded())
    
    startNewRound()
    
    //    slider transformation
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") // UIImage(named: "SliderThumb-Normal")! or type: Image Literal...
       slider.setThumbImage(thumbImageNormal, for: .normal)
       
       let thumbImageHighligted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
       slider.setThumbImage(thumbImageHighligted, for: .highlighted)
       
      //    insets -> like padding in CSS
       let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
       
       let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
       let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
       slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
       
       let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
       let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
       slider.setMaximumTrackImage(trackRightResizable, for: .normal)
  }
  
  @IBAction func sliderNumber(_ sender: UISlider) {
    // rounded value of the slider <- 1.0, 15.224138, 100.0
    valueOfSlider = Int(sender.value.rounded())
      // Int(ceil(sender.value)) rounds always up 50.12 -> 51
  }
  
  @IBAction func showAlert(_ sender: UIButton) {
    
    let difference = abs(targetValue - valueOfSlider)
    // if difference < 0 -> difference = -difference
    
    //    give user points
    var points = 100 - difference
    score += points
    
    let title: String // let -> used just once -> then new instance created
    
    if difference == 0 {
      title = "Perfect"
      points += 100
    } else if difference < 5 {
      title = "You almost had it! (\(difference))"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "Pretty good. (\(difference))"
    } else {
      title = "Not even close! (\(difference))"
    }
    
    let message = "You score \(points) points!"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: {
      action in
      self.startNewRound()
      // swift closer
    })
    
    alert.addAction(action)
    //    who to present
    present(alert, animated: true, completion: nil)
  }
  
  // connected from button to pull onto controller
  @IBAction func startOver() {
    score = 0
    rounds = 0
    startNewRound()
  }
  
  func startNewRound() {
    //    random number
    targetValue = Int.random(in: 1...100)
    
    //   set value of slider to 50 as default
    valueOfSlider = 50
    //    assign into slider
    slider.value = Float(valueOfSlider)
    //    increment round
    rounds += 1
    
    updateLabels()
  }
  
  func updateLabels() {
    //    targetValue displayed in label
    randValue.text = String(targetValue)
    //    show total score
    scoreTotal.text = String(score)
    //    show total of rounds
    roundLabel.text = String(rounds)
  }
}
