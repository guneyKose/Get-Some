//
//  GoalVC.swift
//  getsome
//
//  Created by Güney Köse on 30.01.2022.
//

import UIKit

class GoalVC: UIViewController {

    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
  
    @IBAction func sizeSliderChanged(_ sender: UISlider) {
        let sizeString = String(format: "%.1f", sender.value)
        glassLabel.text = "your glass size is \(sizeString) lt."
    }
    
    @IBAction func goalSliderChanged(_ sender: UISlider) {
        let goalString = String(format: "%.1f", sender.value)
        goalLabel.text = "your goal is \(goalString) lt."
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
