//
//  ViewController.swift
//  Atkins_PracticeExam02
//
//  Created by Andrew Atkins on 4/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var excerciseTypeOL: UITextField!
    @IBOutlet weak var durationOL: UITextField!
    
    @IBOutlet weak var cpmOL: UITextField!
    
    var type = ""
    var dur = 0
    var cpm = 0
    var calc = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func calculateBTN(_ sender: UIButton) {
        type = String(excerciseTypeOL.text!)
        dur = Int(durationOL.text!)!
        cpm = Int(cpmOL.text!)!
        
        calc = dur * cpm
        
    }
    
    @IBAction func resetBTN(_ sender: Any) {
        excerciseTypeOL.text!=""
        durationOL.text!=""
        cpmOL.text!=""
        type = ""
        dur = 0
        cpm = 0
        calc = 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "calcSegue"{
            var destination = segue.destination as!CalcViewController
            destination.activity = type
            destination.duration = dur
            destination.fcpm = cpm
            destination.ftcb = calc
            
        }
    }
}

