//
//  ViewController.swift
//  HelloApp
//
//  Created by Atkins,Andrew C on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var InputOL: UITextField!
    @IBOutlet weak var LabelOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func SubmitBtnClicked(_ sender: UIButton) {
        //read the text fied data or user input
        //and assign it to a var
        var name = InputOL.text!
        
        //display the output in ("Hello,\(name)!")
        LabelOL.text = "Hello,\(name)!"
        
    }
    

}

