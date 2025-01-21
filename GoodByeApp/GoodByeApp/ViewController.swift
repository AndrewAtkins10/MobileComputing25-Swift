//
//  ViewController.swift
//  GoodByeApp
//
//  Created by Atkins,Andrew C on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputLNOL: UITextField!
    
    @IBOutlet weak var inputFNOL: UITextField!
    @IBOutlet weak var LabelOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SubmitBtnClicked(_ sender: UIButton) {
        //read text user input and assign it to user var
        var Lname = inputLNOL.text!
        var Fname = inputFNOL.text!
        
        //display the output to the label in ("Hello,\(name)!"
        LabelOL.text = "Goodbye, \(Fname) \(Lname)!"
    }
    


}

