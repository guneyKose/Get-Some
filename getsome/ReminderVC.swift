//
//  ReminderViewController.swift
//  getsome
//
//  Created by Güney Köse on 30.01.2022.
//

import UIKit

class ReminderVC: UIViewController {
    
    @IBOutlet weak var oneHourSwitch: UISwitch!
    @IBOutlet weak var twoHourSwitch: UISwitch!
    @IBOutlet weak var threeHourSwitch: UISwitch!
    
    @IBAction func oneHourSwitched(_ sender: UISwitch) {
        twoHourSwitch.isOn = oneHourSwitch.isOn ? false:false
        threeHourSwitch.isOn = oneHourSwitch.isOn ? false:false
    }
    @IBAction func twoHourSwitched(_ sender: UISwitch) {
        oneHourSwitch.isOn = twoHourSwitch.isOn ? false:false
        threeHourSwitch.isOn = twoHourSwitch.isOn ? false:false
    }
    @IBAction func threeHourSwitched(_ sender: UISwitch) {
        oneHourSwitch.isOn = threeHourSwitch.isOn ? false:false
        twoHourSwitch.isOn = threeHourSwitch.isOn ? false:false
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
// something.done = !somethingelse.done for bool
    
    // ternary operator :
    //value = condition ? valueIfTrue : valueIfFalse
    //cell.accessoryType = item.done == true ? .checkmark : .none

}
