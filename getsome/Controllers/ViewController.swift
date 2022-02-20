//
//  ViewController.swift
//  getsome
//
//  Created by Güney Köse on 27.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var drinkButton: UIButton!
    
    var numberOfGlasses = 0
    var numberOfGlassesLeft = 0
    var progress: Float {
        GoalVC.progressValue
    }
    var player: AVAudioPlayer!
    let defaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        numberOfGlassesLeft = GoalVC.requiredGlassQuantity
        if GoalVC.progressValue == 0 {
            GoalVC.progressValue = defaults.float(forKey: "progress")
        }
        
        let savedDay = defaults.integer(forKey: "dayReminder")
        let currentDateAsDay = Date().get(.day)
        
        progressBar.progress = currentDateAsDay > savedDay ? 0 : defaults.float(forKey: "progressBar")
    
        //numberOfGlasses = defaults.integer(forKey: "numberOfGlasses")
        //numberOfGlassesLeft = defaults.integer(forKey: "numberOfGlassesLeft")
    }
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        if progress == 0 {
            performSegue(withIdentifier: "GoalVC", sender: sender)
        } else {
            numberOfGlasses += 1
            progressBar.progress += progress
            progressLabel.text = "you drank \(numberOfGlasses) of glasses of water today."
            goalLabel.text = "\(numberOfGlassesLeft) glasses to go!"
        }
        if numberOfGlassesLeft > 0 {
            numberOfGlassesLeft -= 1
        }
        if progressBar.progress == 1 {
            progressLabel.text = "you achieved your goal!"
        }
        defaults.set(progressBar.progress, forKey: "progressBar")
        //defaults.set(numberOfGlasses, forKey: "numberOfglasses")
        //defaults.set(numberOfGlassesLeft, forKey: "numberOfGlassesLeft")
        playSound()
        
        //enum
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "water", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    func updateUI() {
        progressBar.progress = 0
        progressLabel.text = "track your progress"
        goalLabel.text = ""
        numberOfGlasses = 0
        numberOfGlassesLeft = 0
    }
}

