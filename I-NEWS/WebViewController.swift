
//
//  WebViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 09/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
var urlname = ""
    @IBOutlet weak var myview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: urlname)
        let requestObj = URLRequest(url: url!)
        myview.loadRequest(requestObj)
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
