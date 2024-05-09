//
//  BusinesscontentViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 02/04/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class BusinesscontentViewController: UIViewController {
    @IBOutlet weak var conlbl: UILabel!
    var tb = ""
    
    @IBOutlet weak var deslbl: UILabel!
    //@IBOutlet weak var deslbl: Speciallabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tb)
       deslbl.text = tb
        
        //tb = deslbl.text!
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
