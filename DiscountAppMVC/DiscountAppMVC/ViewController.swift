//
//  ViewController.swift
//  DiscountAppMVC
//
//  Created by Andrew Atkins on 3/20/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountOL: UITextField!
    
    @IBOutlet weak var discountOL: UITextField!
    var priceAfterDiscount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcBTN(_ sender: UIButton) {
        //read amount and convert to double
        var amount=Double(amountOL.text!)
        //read discount rate and convert to double
        var discountRate=Double(discountOL.text!)
        
        //calculate price after discount
        priceAfterDiscount = amount! * (1-discountRate!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "ResultSegue"{
            //create the destination as resident view controller
            var destinaton = segue.destination as!ResultViewController
            //pass the data
            
            destinaton.amount = amountOL.text!
            destinaton.discount=discountOL.text!
            destinaton.priceAfterDiscount=String(priceAfterDiscount)
            
        }
    }
    
}

