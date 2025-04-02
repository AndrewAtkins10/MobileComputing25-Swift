//
//  CalcViewController.swift
//  Atkins_PracticeExam02
//
//  Created by Andrew Atkins on 4/1/25.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var atOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    @IBOutlet weak var tcbOL: UILabel!
    @IBOutlet weak var cpmOL: UILabel!
    @IBOutlet weak var durOL: UILabel!
    
    var activity = ""
    var ftcb = 0
    var fcpm = 0
    var duration = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        atOL.text=atOL.text! + String(activity)
        durOL.text=durOL.text!+String(duration)
        cpmOL.text=cpmOL.text!+String(fcpm)
        tcbOL.text=tcbOL.text!+String(ftcb)
        //if statement of if we can find the image name, show the image output
        //else show default output
        if let image = UIImage(named: activity) {
            imageOL.image = UIImage(named: activity)
        } else {
            // Image doesn't exist - use default image
            imageOL.image = UIImage(named: "default")
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
