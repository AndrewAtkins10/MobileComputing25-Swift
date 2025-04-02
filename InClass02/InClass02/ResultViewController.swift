//
//  ResultViewController.swift
//  InClass02
//
//  Created by Andrew Atkins on 3/27/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var timeLBL: UILabel!
    @IBOutlet weak var roiLBL: UILabel!
    @IBOutlet weak var prinLBL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    var enteredPrin = 0.0
    var enteredROI = 0.0
    var enteredTime = 0.0
    var finalCalc = 0.0
    var image = ""
    var catName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prinLBL.text = prinLBL.text! + String(enteredPrin)
        roiLBL.text=roiLBL.text!+String(enteredROI)
        timeLBL.text=timeLBL.text!+String(enteredTime)
        
        
        resultLBL.text="""
Your Interest is: \(finalCalc)
Which is considered: \(catName)
"""
        imageOL.image = UIImage(named: image)
        imageOL.alpha = 0.0
        UIView.animate(withDuration: 1.0){ [self] in
            imageOL.self.alpha = 1.0
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
