//
//  ViewController.swift
//  getsome
//
//  Created by Güney Köse on 27.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var numberOfGlasses = 0
    var numberOfGlassesLeft = 0
    var progress: Float = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidAppear(_ animated: Bool) {
        progress = GoalVC.progressValue
        numberOfGlassesLeft = GoalVC.requiredGlassQuantity
    }
    
    @IBAction func drinkButtonPressed(_ sender: UIButton) {
        if progress == 0 {
            progressLabel.text = "set your goal first!"
        } else {
            numberOfGlasses += 1
            progressBar.progress += progress
            progressLabel.text = "you drank \(numberOfGlasses) of glasses of water today."
            goalLabel.text = "\(numberOfGlassesLeft) glasses to go!"
        }
        if numberOfGlassesLeft > 0 {
            numberOfGlassesLeft -= 1
        }
        if progressBar.progress == 1{
            progressLabel.text = "you achieved your goal!"
        }
        playSound()
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "water", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

