//
//  ViewController.swift
//  Atkins_Exam01
//
//  Created by Andrew Atkins on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var PM25OL: UITextField!
    
    @IBOutlet weak var PM10OL: UITextField!
    
    @IBOutlet weak var CQBTN: UIButton!
    
    @IBOutlet weak var RBTN: UIButton!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func calculateAQC(_ sender: UIButton) {
        // Get PM2.5 and PM10 values from text fields
        guard let pm25Text = PM25OL.text, let pm10Text = PM10OL.text,
              let pm25 = Int(pm25Text), let pm10 = Int(pm10Text) else {
            outputOL.text = "Please enter valid numeric values for PM2.5 and PM10."
            imageOL.image = nil
            return
        }
        
        // Calculate AQC
        let aqc = Double(pm25 + pm10) / 2.0
        
        // Round AQC to one decimal place
        let roundedAQC = round(aqc * 10) / 10
        
        // Determine category and message
        var category: String
        var daText: String
        
        if roundedAQC < 50 {
            category = "Best"
            daText = "This is considered to be best👍 air quality air."
        } else if roundedAQC >= 50 && roundedAQC < 100 {
            category = "Moderate"
            daText = "This is considered to be Moderate😐 quality air."
        } else {
            category = "Poor"
            daText = "This is considered to be poor quality air😢"
        }
        
        // Update output label and image
        outputOL.text = "The AQC value is \(roundedAQC).\n\(daText)"
        imageOL.image = UIImage(named: category)
    }
    
    @IBAction func resetBTN(_ sender: UIButton) {
        // Reset all fields
        outputOL.text = ""
        PM25OL.text = ""
        PM10OL.text = ""
        imageOL.image = nil
    }
}
