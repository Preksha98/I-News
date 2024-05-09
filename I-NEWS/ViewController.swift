//
//  ViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 17/10/18.
//  Copyright © 2018 Prexa Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainlogo: UIImageView!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtpwd: UITextField!
    
    var loginkey : Bool?
    
    var lid : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var id = UserDefaults.standard.bool(forKey: "loginkey")
        if id
        {
            performSegue(withIdentifier: "login", sender: nil)
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnreg(_ sender: Any) {
    }
    
    @IBAction func btnforpwd(_ sender: Any) {
        
        let providedEmailAddress = txtemail.text
        
        
        let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress!)
        
        if isEmailAddressValid
        {
            print("Email address is valid")
             POST_Data()
            performSegue(withIdentifier: "home", sender: nil)
        } else {
            print("Email address is not valid")
            displayAlertMessage(messageToDisplay: "Email address is not valid")
        }
        
    }
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            
            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");
            
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
        
        
        
        
        
    }
    
    
    
    @IBAction func btnlogin(_ sender: Any) {
        
        
        
        
        
        
        
        
        let providedEmailAddress = txtemail.text


        let isEmailAddressValid = isValidEmailAddress1(emailAddressString: providedEmailAddress!)

        if isEmailAddressValid
        {
            print("Email address is valid")
//            let providepassword = txtpwd.text
//            let isPasswordValid = isValidPassword(testStr: providepassword!)
//            if isPasswordValid
//            {
//                print("Password correct")
            
            
            if (txtemail.text == "admin@gmail.com")
            {
                if (txtpwd.text == "admin")
                {
                    performSegue(withIdentifier: "adminpanel", sender: nil)
                }
            }
            else{
            POST_Data()
            //}
            
//            else{
//                print("incorrect password")
//                displayAlertMessage(messageToDisplay: "Incorrect password")
//            }
//
        }
        }
            
        
        else {
            print("Email address is not valid")
            displayAlertMessage1(messageToDisplay: "Email address is not valid")
        }

    }

    func isValidEmailAddress1(emailAddressString: String) -> Bool {

        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                returnValue = false
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }

        return  returnValue
    }

    func displayAlertMessage1(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "Alert", message: messageToDisplay, preferredStyle: .alert)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in

            // Code in this block will trigger when OK button tapped.
            print("Ok button tapped");

        }

        alertController.addAction(OKAction)

        self.present(alertController, animated: true, completion:nil)


        
        //chlkValidation()
        
        
        
       
       
        
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
    
//    public func isValidPassword() -> Bool {
//        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
//        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
//    }
//
//    var msg = ""
//
//
//
//    func chlkValidation() -> Bool {
//        var flag : Bool = true
//        let v = validation()
//        if(v.isempty(value: txtemail.text!))
//        {
//                flag = false
//                msg = "please enter email"
//            alertvalidation()
//        }
//        else
//        {
//            if(v.isempty(value: txtpwd.text!))
//              {
//
//                flag = false
//                msg = "plz enter password"
//                alertvalidation()
//            }
//              else{
//                alertvalidation()
//            }
//        }
////        if(v.isVaildnumber(value: number!) == false)
////            {
////            flag = false
////            msg = "plz enter number"
////
////        }
////        else if( v.isValidEmail(testStr: emailvali!) == false)
////        {
////            flag = false
////            msg = "plz enter email"
////
////        }
////
////        if(v.isempty(value: password!) == false)
////            {
////
////            flag = false
////
////            msg = "plz enter password"
////
////           }
////
//        return flag
//
//    }
//
//    func alertvalidation() {
//        if chlkValidation()
//        {
//            let actionSheetController: UIAlertController = UIAlertController(title: "Registration", message: "Sucess", preferredStyle: .alert)
//            let OkAction: UIAlertAction = UIAlertAction(title: "Ok", style:.default) { action -> Void in
//                self.POST_Data()
//
//            }
//            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancle", style: .cancel) { action -> Void in
//                print("f")
//            }
//
//            actionSheetController.addAction(cancelAction)
//
//            actionSheetController.addAction(OkAction)
//
//        self.present(actionSheetController, animated: true, completion: nil)
//
//        }
//            else
//        {
//            let actionSheetController: UIAlertController = UIAlertController(title: "Registration", message: msg, preferredStyle: .alert)
//            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
//            }
//            actionSheetController.addAction(cancelAction)
//
//            self.present(actionSheetController, animated: true, completion: nil)
//
//        }
//
//    }
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "login.php")
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["Email":txtemail.text,"Password":txtpwd.text];
        
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
                            self.parsdata(res: resDict as! [String : Any])
                            
                            // self.parsdata(result: resDict as! [String : Any])
                            
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
      
       
//        var lid = res["lid "] as? Int
//        print(lid)
        
        
    
//        var lid = res["lid"] as! Int
//
        
        
        var status = res["status"] as! String
        
        if status == "true"
        {
            var msg =   res["msg"] as? String
            print(msg)
             loginkey = true
               lid = res["lid"] as! String
            UserDefaults.standard.set(lid, forKey: "lid")
              UserDefaults.standard.set(true,forKey: "loginkey")
            performSegue(withIdentifier: "login", sender: nil)
        }
        else{
            displayAlertMessage1(messageToDisplay: "Invalid id password ")
            
        }
       
        
        
        
      
        
            //performSegue(withIdentifier: "login", sender: nil)

        

        
    }

}

