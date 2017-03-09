//
//  ViewController.swift
//  TipCalculator
//
//  Created by Danny Glover on 2/16/17.
//  Copyright © 2017 Danny Glover. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var singleSplit: UILabel!
    @IBOutlet weak var tripleSplit: UILabel!
    @IBOutlet weak var doubleSplit: UILabel!
    @IBOutlet weak var quadSplit: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var tipDisplayLabel: UILabel!
    
    
    @IBOutlet weak var billAmountLabel: UILabel!
    
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    
    @IBOutlet weak var singleSplitLabel: UILabel!
    @IBOutlet weak var doubleSplitLabel: UILabel!
    @IBOutlet weak var tripleSplitLabel: UILabel!
    @IBOutlet weak var quadSplitLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountInput.becomeFirstResponder()
        self.amountInput.delegate = self
        tipDisplayLabel.text = "\(String(Int(round(tipSlider.value))))%"
        checkForPreviousBill()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tipValue = defaults.integer(forKey: "default_tip")
        let darkMode = defaults.bool(forKey: "dark_mode")
        updateUI(darkMode: darkMode)
        tipSlider.value = Float(tipValue)
        tipDisplayLabel.text = "\(String(Int(round(tipSlider.value))))%"
        updateTip()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    @IBAction func amountChange(_ sender: Any) {
        updateTip()
    }
    
    
    @IBAction func tipChange(_ sender: Any) {
        tipDisplayLabel.text = "\(String(Int(round(tipSlider.value))))%"
        updateTip()
    }
    
    @IBAction func didTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func updateTip() {
        let selectedTipAmount = Double(round(tipSlider.value)) / 100
        
        let inputAmountDouble = Double(amountInput.text!) ?? 0
     
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
    
        let tipAmount = inputAmountDouble * selectedTipAmount
        let tipNSNumber = NSNumber(value: tipAmount)
        let totalNSNumber = NSNumber(value: (tipAmount+inputAmountDouble))
        let doubleSplitNSNumber = NSNumber(value:(tipAmount+inputAmountDouble) / 2 )
        let tripSplitNSNumber = NSNumber(value:(tipAmount+inputAmountDouble) / 3 )
        let quadSplitNSNumber = NSNumber(value:(tipAmount+inputAmountDouble) / 4 )

        tipLabel.text = formatter.string(from: tipNSNumber)
        totalLabel.text = formatter.string(from: totalNSNumber)
        singleSplit.text = formatter.string(from: totalNSNumber)
        doubleSplit.text = formatter.string(from: doubleSplitNSNumber)
        tripleSplit.text = formatter.string(from: tripSplitNSNumber)
        quadSplit.text = formatter.string(from: quadSplitNSNumber)
        
        defaults.set(inputAmountDouble, forKey: "bill_amount")
        defaults.synchronize()
    }
    
    func checkForPreviousBill() {
        let lastExit = defaults.object(forKey: "exit_time")
        let timeElapsed = NSDate().timeIntervalSince(lastExit as! Date)
        let minutesElapsed = timeElapsed / 60
        print("minutes elapsed \(minutesElapsed)")
        if minutesElapsed < 10 {
            let savedBillAmount = defaults.double(forKey: "bill_amount")
            print("savedBillAmount: \(savedBillAmount)")
            amountInput.text = String(savedBillAmount)
            updateTip()
        } else {
            amountInput.text = ""
            updateTip()
        }

    }
    
    func updateUI(darkMode: Bool) {
        if(darkMode) {
            view.backgroundColor = UIColor.darkGray
            tipDisplayLabel.textColor = UIColor.white
            billAmountLabel.textColor = UIColor.white
            amountInput.textColor = UIColor.white
            tipSlider.minimumTrackTintColor = UIColor.yellow
            amountInput.backgroundColor = UIColor.black
            tipLabel.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            singleSplit.textColor = UIColor.white
            doubleSplit.textColor = UIColor.white
            tripleSplit.textColor = UIColor.white
            quadSplit.textColor = UIColor.white
            tipTitleLabel.textColor = UIColor.white
            totalTitleLabel.textColor = UIColor.white
            singleSplitLabel.text = "👻"
            doubleSplitLabel.text = "👻👻"
            tripleSplitLabel.text = "👻👻👻"
            quadSplitLabel.text = "👻👻👻👻"
            
            
        } else {
            view.backgroundColor = UIColor.white
            tipDisplayLabel.textColor = UIColor.black
            billAmountLabel.textColor = UIColor.black
            amountInput.textColor = UIColor.black
            tipSlider.minimumTrackTintColor = UIColor.blue
            amountInput.backgroundColor = UIColor.white
            tipLabel.textColor = UIColor.black
            totalLabel.textColor = UIColor.black
            singleSplit.textColor = UIColor.black
            doubleSplit.textColor = UIColor.black
            tripleSplit.textColor = UIColor.black
            quadSplit.textColor = UIColor.black
            tipTitleLabel.textColor = UIColor.black
            totalTitleLabel.textColor = UIColor.black
            singleSplitLabel.text = "🦁"
            doubleSplitLabel.text = "🦁🦁"
            tripleSplitLabel.text = "🦁🦁🦁"
            quadSplitLabel.text = "🦁🦁🦁🦁"
            
        }
    
    }
    
    
}


