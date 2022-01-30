//
//  ReminderViewController.swift
//  getsome
//
//  Created by Güney Köse on 30.01.2022.
//

import UIKit
import AVFoundation

class ReminderVC: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var oneHourSwitch: UISwitch!
    @IBOutlet weak var twoHourSwitch: UISwitch!
    @IBOutlet weak var threeHourSwitch: UISwitch!
    @IBOutlet weak var sleepLabel: UILabel!
    
    @IBAction func oneHourSwitched(_ sender: UISwitch) {
        twoHourSwitch.isOn = oneHourSwitch.isOn ? false:false
        threeHourSwitch.isOn = oneHourSwitch.isOn ? false:false
        playSound()
    }
    @IBAction func twoHourSwitched(_ sender: UISwitch) {
        oneHourSwitch.isOn = twoHourSwitch.isOn ? false:false
        threeHourSwitch.isOn = twoHourSwitch.isOn ? false:false
        playSound()
    }
    @IBAction func threeHourSwitched(_ sender: UISwitch) {
        oneHourSwitch.isOn = threeHourSwitch.isOn ? false:false
        twoHourSwitch.isOn = threeHourSwitch.isOn ? false:false
        playSound()
    }
    @IBAction func sleepSlider(_ sender: UISlider) {
        let sleepDuration = String(format: "%.0f", sender.value)
        sleepLabel.text = "you sleep \(sleepDuration) hours."
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        playSound()
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "water", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

// something.done = !somethingelse.done for bool
    
    // ternary operator :
    //value = condition ? valueIfTrue : valueIfFalse
    //cell.accessoryType = item.done == true ? .checkmark : .none

}
