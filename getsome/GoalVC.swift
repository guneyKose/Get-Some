//
//  GoalVC.swift
//  getsome
//
//  Created by Güney Köse on 30.01.2022.
//

import UIKit

class GoalVC: UIViewController {

    var goal: Float = 0
    var size: Float = 0
    static var progressValue: Float = 0
    
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
  
    @IBAction func sizeSliderChanged(_ sender: UISlider) {
        let sizeString = String(format: "%.1f", sender.value)
        glassLabel.text = "your glass size is \(sizeString) lt."
        size = sender.value
    }
    
    @IBAction func goalSliderChanged(_ sender: UISlider) {
        let goalString = String(format: "%.1f", sender.value)
        goalLabel.text = "your goal is \(goalString) lt."
        goal = sender.value
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        GoalVC.progressValue = size / goal
        ViewController().progress = GoalVC.progressValue
        print(GoalVC.progressValue)
    }
}
