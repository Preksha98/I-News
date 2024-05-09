//
//  ContentViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 26/02/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
var con = ""
    
    @IBOutlet weak var lblhead: UILabel!
    
    @IBOutlet weak var lblcontent: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblcontent.text = con
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
