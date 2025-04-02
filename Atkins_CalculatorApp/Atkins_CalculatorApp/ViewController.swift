//
//  ViewController.swift
//  Atkins_CalculatorApp
//
//  Created by Andrew Atkins on 2/24/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputOL: UILabel!
    
    @IBOutlet weak var divBTN: UIButton!
    
    @IBOutlet weak var posBTN: UIButton!
    
    @IBOutlet weak var cBTN: UIButton!
    
    @IBOutlet weak var acBTN: UIButton!
    
    @IBOutlet weak var sevenBTN: UIButton!
    
    @IBOutlet weak var eightBTN: UIButton!
    
    @IBOutlet weak var nineBTN: UIButton!
    
    @IBOutlet weak var fourBTN: UIButton!
    
    @IBOutlet weak var fiveBTN: UIButton!
    
    @IBOutlet weak var sixBTN: UIButton!
    
    @IBOutlet weak var oneBTN: UIButton!
    
    @IBOutlet weak var twoBTN: UIButton!
    
    @IBOutlet weak var threeBTN: UIButton!
    
    @IBOutlet weak var zeroBTN: UIButton!
    
    @IBOutlet weak var periodBTN: UIButton!
    
    @IBOutlet weak var percentBTN: UIButton!
    
    @IBOutlet weak var multiplyBTN: UIButton!
    
    @IBOutlet weak var subtractionBTN: UIButton!
    @IBOutlet weak var addBTN: UIButton!
    
    @IBOutlet weak var equalBTN: UIButton!
    
    var curNum: String = ""
    var prevNum: String = ""
    var type: String = ""
    var performOp: Bool = false


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputOL.text = "0"
    }
@IBAction func numberButtonTapped(_ sender: UIButton) {
    let number = sender.titleLabel?.text ?? ""
        
    if performOp {
        outputOL.text = number
        curNum = number
        performOp = false
        }
    else {
        if outputOL.text == "0" {
            outputOL.text = number
            }
        else {
            outputOL.text! += number
            }
        curNum = outputOL.text!
        }
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        if let operatorSymbol = sender.titleLabel?.text {
            type = operatorSymbol
            prevNum = curNum
            performOp = true
            }
        }

    @IBAction func equalButtonTapped(_ sender: UIButton) {
        performCalculation()
        }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        outputOL.text = "0"
        curNum = ""
        prevNum = ""
        type = ""
        }

    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        outputOL.text = "0"
        curNum = ""
        prevNum = ""
        type = ""
        }

    @IBAction func signChangeButtonTapped(_ sender: UIButton) {
        if var number = Double(curNum) {
            number *= -1
            curNum=String(number)
            outputOL.text = curNum
            }
        }

    @IBAction func percentButtonTapped(_ sender: UIButton) {
        if var number=Double(curNum) {
            number /= 100
            curNum = String(number)
            outputOL.text = curNum
            }
        }

    @IBAction func decimalButtonTapped(_ sender: UIButton) {
        if !curNum.contains(".") {
            curNum += "."
            outputOL.text = curNum
            }
        }
    func performCalculation() {
        guard let previous = Double(prevNum), let current = Double(curNum)
        else { return }
            
        var result: Double = 0
            
        switch type {
        case "+":
            result = previous + current
        case "-":
            result = previous - current
        case "*":
            result = previous * current
        case "÷":
            result = previous / current
        case "%":
            result = previous.truncatingRemainder(dividingBy: current)
        default:
            break
        }
            
        if type == "÷" && current == 0 {
            outputOL.text = "nan"
        }
        else {
                
            if result == Double(Int(result)) {
                outputOL.text = String(Int(result))
                }
            else {
                outputOL.text = String(result)
                }
            }
            
            
        curNum = outputOL.text ?? ""
        prevNum = ""
        type = ""
        performOp = true
        }

    }

