//
//  SciencecontentViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 02/04/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class SciencecontentViewController: UIViewController {
var ts = ""
    @IBOutlet weak var consclbl: UILabel!
    @IBOutlet weak var scconlbl: Speciallabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scconlbl.text = ts
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
