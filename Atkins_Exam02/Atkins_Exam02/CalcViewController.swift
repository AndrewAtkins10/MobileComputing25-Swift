//
//  CalcViewController.swift
//  Atkins_Exam02
//
//  Created by Andrew Atkins on 4/3/25.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var saveOL: UILabel!
    @IBOutlet weak var irOL: UILabel!
    @IBOutlet weak var taOL: UILabel!
    @IBOutlet weak var typeOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var type = ""
    var ta = 0
    var ir = 0.0
    var savings = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageOL.alpha = 0.0
        UIView.animate(withDuration: 1.5) {
            self.imageOL.alpha = 1.0
        }
        saveOL.text=saveOL.text! + String(savings)
        irOL.text=irOL.text!+String(ir)
        taOL.text=taOL.text!+String(ta)
        typeOL.text=typeOL.text!+String(type)
        //if statement of if we can find the image name, show the image output
        //else show default output
        if let image = UIImage(named: type) {
            UIView.animate(withDuration: 1.5) {
                self.imageOL.image = UIImage(named: self.type)
                self.imageOL.alpha = 1.0
            }
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
