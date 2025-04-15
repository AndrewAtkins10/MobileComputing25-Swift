//
//  ViewController.swift
//  Atkins_Exam02
//
//  Created by Andrew Atkins on 4/3/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var typeOL: UITextField!
    
    @IBOutlet weak var tpOL: UITextField!
    @IBOutlet weak var irOL: UITextField!
    @IBOutlet weak var taOL: UITextField!
    
    var type = ""
    var totalMonths = 0.00
    var monthlyInterestRate = 0.00
    var monthlySavingsPayment = 0.00
    var timePeriod = 0.00
    var interestRate = 0.00
    var targetAmount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcBTN(_ sender: Any) {
        type = String(typeOL.text!).lowercased()
        timePeriod = Double(tpOL.text!)!
        interestRate = Double(irOL.text!)!
        targetAmount = Int(taOL.text!)!
        totalMonths = timePeriod * 12
        monthlyInterestRate = (interestRate / 100) / 12
        monthlySavingsPayment = Double(targetAmount) / ((pow(1 +       monthlyInterestRate, totalMonths ) - 1) / monthlyInterestRate)
        monthlySavingsPayment = round(100 * monthlySavingsPayment) / 100
    }
    
    @IBAction func resetBTN(_ sender: Any) {
        typeOL.text!=""
        irOL.text!=""
        taOL.text!=""
        tpOL.text!=""
        type = ""
        totalMonths = 0.00
        monthlyInterestRate = 0.00
        monthlySavingsPayment = 0.00
        timePeriod = 0.00
        interestRate = 0.00
        targetAmount = 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "calcSegue"{
            var destination = segue.destination as!CalcViewController
            destination.type = type
            destination.ta = targetAmount
            destination.ir = interestRate
            destination.savings = monthlySavingsPayment
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Reset all input fields
        typeOL.text!=""
        irOL.text!=""
        taOL.text!=""
        tpOL.text!=""
        
    }

}
