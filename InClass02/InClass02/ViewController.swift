//
//  ViewController.swift
//  InClass02
//
//  Created by Andrew Atkins on 3/27/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var prinOL: UITextField!
    
    @IBOutlet weak var roiOL: UITextField!
    @IBOutlet weak var timeOL: UITextField!
    
    var principal=0.0
    var roi = 0.0
    var time = 0.0
    var categoryName = ""
    var imgname = ""
    var calced = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CalcBTN(_ sender: UIButton) {
        principal = Double(prinOL.text!)!
        roi = Double(roiOL.text!)!
        time = Double(timeOL.text!)!
        categoryName = ""
        imgname = ""
        calced = (principal * roi + time)/100
        
        if calced < 100{
            categoryName = "Low"
            imgname = "low"
            
        }
        else if calced >= 100 {
            categoryName = "Medium"
            imgname = "medium"
            
            
        }
        else if calced <= 500{
            categoryName = "High"
            imgname = "high"
        }
        else{
            categoryName = "Please enter a valid number for the calculation"
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "Resultsegue"{
            var destination = segue.destination as!ResultViewController
            destination.enteredPrin = principal
            destination.enteredROI = roi
            destination.enteredTime = time
            destination.finalCalc = calced
            destination.catName = categoryName
            
            destination.image = imgname
        }
        
    }
}
