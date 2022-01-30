//
//  ViewController.swift
//  getsome
//
//  Created by Güney Köse on 27.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var numberOfGlasses = 0
    var numberOfGlassesLeft = 0
    var progress: Float = 0

    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        numberOfGlasses += 1
        numberOfGlassesLeft -= 1
        progressBar.progress += progress
        progressLabel.text = "you drank \(numberOfGlasses) of glasses of water today."
        goalLabel.text = "\(numberOfGlassesLeft) glasses to go!"
    }
}

