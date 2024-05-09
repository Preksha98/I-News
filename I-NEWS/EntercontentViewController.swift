//
//  EntercontentViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 02/04/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class EntercontentViewController: UIViewController {
    var te = ""

    @IBOutlet weak var elbl: Speciallabel!
    @IBOutlet weak var econlbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 elbl.text = te
        // Do any additional setup after loading the view.
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
