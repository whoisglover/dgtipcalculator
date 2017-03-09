//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Danny Glover on 2/24/17.
//  Copyright © 2017 Danny Glover. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipDisplayLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var settingScreenTitleLabel: UILabel!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tipValue = defaults.integer(forKey: "default_tip")
        let darkMode = defaults.bool(forKey: "dark_mode")
        tipSlider.value = Float(tipValue)
        darkModeSwitch.isOn = darkMode
        updateUI(darkMode: darkMode)
        tipDisplayLabel.text = "\(String(Int(round(tipSlider.value))))%"
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        tipDisplayLabel.text = "\(String(Int(round(tipSlider.value))))%"
        let tipAmount = Int(round(tipSlider.value))
        
        defaults.set(tipAmount, forKey: "default_tip")
        defaults.synchronize()
        print(tipAmount)

    }
    @IBAction func darkModeToggled(_ sender: UISwitch) {
        if sender.isOn {
            defaults.set(true, forKey: "dark_mode")
            updateUI(darkMode: true)
        } else {
            defaults.set(false, forKey: "dark_mode")
            updateUI(darkMode: false)
        }
    }
    
    func updateUI(darkMode: Bool) {
        if(darkMode) {
            view.backgroundColor = UIColor.darkGray
            tipDisplayLabel.textColor = UIColor.white
            darkModeLabel.textColor = UIColor.white
            settingScreenTitleLabel.textColor = UIColor.white
            tipSlider.minimumTrackTintColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.white
            tipSlider.minimumTrackTintColor = UIColor.blue
            tipDisplayLabel.textColor = UIColor.black
            darkModeLabel.textColor = UIColor.black
            settingScreenTitleLabel.textColor = UIColor.black
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
