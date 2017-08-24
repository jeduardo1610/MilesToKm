//
//  ViewController.swift
//  MilesToMeters
//
//  Created by Jorge Eduardo on 13/07/17.
//  Copyright © 2017 Jorge Eduardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var distanceTextField: UITextField!
    
    @IBOutlet weak var optionsSegmentedControl: UISegmentedControl!

    @IBOutlet weak var resultLabel: UILabel!
    
    let mileUnit : Double = 1.609
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        distanceTextField.delegate = self
        self.hideKeyboardWhenTappingAround()
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        
        let selectedIndex : Int = optionsSegmentedControl.selectedSegmentIndex
        
        if let value = Double(distanceTextField.text!) {
            
            if selectedIndex == 0 {
                //To miles
                let res : Double = value / mileUnit
                let resString : String = String(format: "%.2f", res)
                resultLabel.text = "\(resString) miles"
            }else {
                //To kilometers
                let res : Double = value * mileUnit
                let resString : String = String(format: "%.2f", res)
                resultLabel.text = "\(resString) kilometers"
            }
        } else {
            resultLabel.text = "Insert a valid number"
        }

    }
    
    override var prefersStatusBarHidden: Bool { //hide or show status bar
        return true
    }
    
}

extension ViewController : UITextFieldDelegate {
    //Hide keyboard when tapping return/intro
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension ViewController {
    //Hide keyboard by implementing tap gesture recognizer in order to "listen" for user tapping around the app screen
    func hideKeyboardWhenTappingAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
}

