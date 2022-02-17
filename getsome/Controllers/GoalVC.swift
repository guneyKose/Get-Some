//
//  GoalVC.swift
//  getsome
//
//  Created by Güney Köse on 30.01.2022.
//

import UIKit
import AVFoundation

class GoalVC: UIViewController {

    var player: AVAudioPlayer!
    var goal: Float {
        return goalSlider.value
    }
    var size: Float {
        return sizeSlider.value
    }
    static var requiredGlassQuantity: Int = 0
    static var progressValue: Float = 0
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var goalSlider: UISlider!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get the user defaults.
        goalSlider.value = defaults.float(forKey: "goal")
        sizeSlider.value = defaults.float(forKey: "size")
    }
    
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
        GoalVC.progressValue = size / goal
        if size != 0 {
            GoalVC.requiredGlassQuantity = Int(goal / size)
        }
        //save the slider values as user defaults.
        defaults.set(goalSlider.value, forKey: "goal")
        defaults.set(sizeSlider.value, forKey: "size")
        defaults.set(GoalVC.progressValue, forKey: "progress")
        playSound()
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "water", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
