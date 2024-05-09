//
//  ChangepasswordViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 20/10/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class ChangepasswordViewController: UIViewController {

    @IBOutlet weak var txtchngpwd: UITextField!
    var mail : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnchngpwd(_ sender: Any) {
        let providepassword = txtchngpwd.text
        let isPasswordValid = isValidPassword(testStr: providepassword!)
        if isPasswordValid
        {
            print("Password correct")
            
            
        POST_Data()
        }
        
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 6 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{6,}")
        return passwordTest.evaluate(with: testStr)
    }
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "chngepassword.php")
        var em = UserDefaults.standard.value(forKey: "email")
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["email":em , "password":txtchngpwd.text];
        
        do {
            
            //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
            let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
            
            //FOR URL REQUEST
            var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            
            //REQUEST HTTP METHOD
            request.httpMethod = "POST"
            
            //REQUEST DATA HTTPBODY JSON
            request.httpBody = reqData
            
            //REQUEST SETVALUE
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            //SESSION
            let session = URLSession.shared
            
            let task = session.dataTask(with: request, completionHandler: { (resData, response, error) in
                if (error != nil){
                    print(error.debugDescription)
                }else{
                    do {
                        
                        let resDict = try JSONSerialization.jsonObject(with: resData!, options: .allowFragments)
                        print(resDict)
                        
                        DispatchQueue.main.async(execute:{
                            //self.parsdata(res: resDict as! [String : Any])
                            //self.parsdata(res: self.otp  as! [String : Any])
                            
                            // self.parsdata(result: resDict as! [String : Any])
                            self.parsdata(res: resDict as! [String : Any])
                            
                        }
                            
                            
                        )
                        
                        
                        
                    }catch{
                        print(exception())
                    }
                }
            })
            task.resume()
        }
        catch{
            print(exception())
        }
        
    }
    
    func parsdata(res : [String:Any])
    {
        
        
        var msg =   res["msg"] as? String
       
        if msg == "update"
        {
          navigationController?.popToRootViewController(animated: true)
        }
        else
        {
            print("Write again")
        }
    }
    
    
    
}
