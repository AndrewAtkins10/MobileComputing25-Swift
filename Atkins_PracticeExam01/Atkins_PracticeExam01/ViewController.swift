//
//  ViewController.swift
//  Atkins_PracticeExam01
//
//  Created by Andrew Atkins on 2/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightFOL: UITextField!
    
    @IBOutlet weak var heightIOL: UITextField!
    
    @IBOutlet weak var weightOL: UITextField!
    
    @IBOutlet weak var resultOL: UILabel!
    
    @IBOutlet weak var bmiOL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        let feet = Int(heightFOL.text ?? "") ?? -1
        let inches = Int(heightIOL.text ?? "") ?? -1
        let weight = Double(weightOL.text ?? "") ?? -1.0
        
        if feet < 0 || inches < 0 || weight < 0 {
            resultOL.text = "Please enter valid numbers."
            return
        }
        
        let totalHeightInches = (feet * 12) + inches
        let bmi = (703 * weight) / pow(Double(totalHeightInches), 2)
        let roundedBMI = round(bmi * 10) / 10.0
        
        let category: String
        let healthTip: String
        
        if roundedBMI <= 18.5 {
            category = "Underweight"
            healthTip = "Eat more protein and healthy fats."
        }
        else if roundedBMI <= 24.9 {
            category = "Normal"
            healthTip = "Excellent! Maintain a balanced lifestyle."
        }
        else if roundedBMI <= 29.9 {
            category = "Overweight"
            healthTip = "Lose weight by maintaining a balanced diet and increasing physical activity."
        }
        else {
            category = "Obese"
            healthTip = "Consult a doctor for personalized advice."
        }
        
        resultOL.text = "Your Body Mass Index is \(roundedBMI).\nThis is considered \(category).\nHealth tip: \(healthTip)."
        
        let imageName = category.lowercased()
        bmiOL.image = UIImage(named: imageName)
        
    }
}
