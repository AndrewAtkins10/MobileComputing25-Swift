//
//  ViewController.swift
//  Mar25
//
//  Created by Andrew Atkins on 3/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var HFeetOL: UITextField!
    
    @IBOutlet weak var HInchesOL: UITextField!
    
    @IBOutlet weak var WLbsOL: UITextField!
    
    var feet = 0
    var inches = 0
    var lbs = 0.0
    var bmi = 0.0
    var categoryName = ""
    var imgname = ""
    var result = ""
    var healthadvice = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BmiBTN(_ sender: Any) {
        feet = Int(HFeetOL.text!)!
        inches = Int(HInchesOL.text!)!
        lbs = Double(WLbsOL.text!)!
        
        let height = feet * 12 + inches
        bmi = 703 * (lbs / Double(height*height))
        
        if bmi < 18.5 {
            categoryName = "Underweight"
            imgname = "underweight"
            healthadvice = "Eat more protein and heathly fats"
        }
        else if bmi < 25 {
            categoryName = "Normal"
            imgname = "normal"
            healthadvice = "Maintain a balanced diet"
            
        }
        else {
            categoryName = "Obese"
            imgname = "obese"
            healthadvice = "Prioritize wight loss and maintain a health lifestyle"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "Resultsegue"{
            var destination = segue.destination as!ResultViewController
            destination.enteredhfeet = feet
            destination.enteredhinches = inches
            destination.enteredwlbs = lbs
            destination.bmiResult = bmi
            destination.categoryMessage = categoryName
            destination.healthMessage = healthadvice
            destination.bmiImageName = imgname
            
            
        }
        
            
    }
    
}

