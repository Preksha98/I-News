//
//  AdmindetailsViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 13/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class AdmindetailsViewController: UIViewController {
    
    var status = ""
    
      var obj = Likesmodal()
    var nid = ""

    @IBOutlet weak var descrititle: UILabel!
    
  
    
    @IBOutlet weak var descrilbl: UILabel!
    
    
    
    @IBOutlet weak var areatitle: UILabel!
    
    
    @IBOutlet weak var arealbl: UILabel!
    
    
    @IBOutlet weak var citytitle: UILabel!
    
    
    @IBOutlet weak var citylbl: UILabel!
    
    
    @IBOutlet weak var lattitle: UILabel!
    
    
    @IBOutlet weak var latlbl: UILabel!
    
    
    @IBOutlet weak var longtitle: UILabel!
    
    
    @IBOutlet weak var longlbl: UILabel!
    
    
    @IBOutlet weak var statustitle: UILabel!
    
    
    @IBOutlet weak var statuslbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       descrilbl.text = obj.des
        arealbl.text = obj.ar
        citylbl.text = obj.ci
        latlbl.text = obj.lat
        longlbl.text = obj.lon
        statuslbl.text = obj.status
        nid = obj.id
     
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnaccept(_ sender: Any) {
    
    status = "accept"
        
    POST_Data()
    
        navigationController?.popViewController(animated: true)

    
    }
    
    
    
    
    @IBAction func btndelete(_ sender: Any) {
    
    status = "not accept"
        POST_Data()
        
    
    
    }
    
    
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "adminaccept.php")
       
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        let reqDict = ["Nid": nid, "Status": status];
        
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
            //navigationController?.popToRootViewController(animated: true)
        }
        else
        {
            print("Rejected")
        }
    }
    
    
    
    
    
    

}
