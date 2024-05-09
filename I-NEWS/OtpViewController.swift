//
//  OtpViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 18/10/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class OtpViewController: UIViewController
{
    
    @IBOutlet weak var txtotp: UITextField!
    
    @IBOutlet weak var lblreceive: UILabel!
    
  //  var b : Int?
   
    
    
   
    @IBOutlet weak var lblresult: UILabel!
    
    @IBAction func btncheck(_ sender: Any) {
    
        
        var b = UserDefaults.standard.integer(forKey: "otp")
        if(b == Int(txtotp.text!))
        {
             lblresult.text = "Checking OTP"
            
            performSegue(withIdentifier: "changepwd", sender: nil)
            
            
        }
        
        else{
            lblresult.text = "wrong OTP"
            
        }
        
    
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
