//
//  SportscontentViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 26/02/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class SportscontentViewController: UIViewController {
    var tp = ""
    
    @IBOutlet weak var lblcont: UILabel!
    
    @IBOutlet weak var lbldet: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       lbldet.text = tp
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
