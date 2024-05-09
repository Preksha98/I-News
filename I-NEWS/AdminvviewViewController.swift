//
//  AdminvviewViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 12/03/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class AdminvviewViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{
    
    var obj = Likesmodal()
    
     var arrModal1 = [Likesmodal]()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        obj = arrModal1[indexPath.row]
        performSegue(withIdentifier: "admindescribe", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrModal1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "admin") as! AdminviewTableViewCell
        
        
        var ob = arrModal1[indexPath.row]
        
        cell.lbladmin.text = ob.des
        
        let reqUrl = URL(string: consturl + ob.im)
        let data = NSData(contentsOf: reqUrl!)
        if data != nil
        {
            cell.imgadmin.image =  UIImage(data:data as! Data)
            
        }
        
       // cell.obj = self
        cell.object = ob
        //  cell.imgnv.image = im[indexPath.row]
        return cell
        
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 534
        
    }
    
    @IBOutlet weak var admintable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
POST_Data()
        // Do any additional setup after loading the view.
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as? AdmindetailsViewController

        vc?.obj = obj
       
    }
    
    
    
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "news_admin.php")
        
        //GET DATA FROM TEXT FIELD AND PUT INTO DICTIONARY on KEY NAME
        //        let reqDict = ["Nid":"","Rid":"" ,"Cid":"","Description":"","Latitude":"" ,"Longitude":""  ,"Area":"" ,"City":"", "Image": "" ] as [String : Any];
        
        
        do {
            
            //DICTIONARY  FORMATE CONVERT JSON FORMATE WITH JSONSERIALIZABLE
            //  let reqData = try JSONSerialization.data(withJSONObject: reqDict, options: .prettyPrinted)
            
            //FOR URL REQUEST
            var request = URLRequest(url: reqUrl!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            
            //REQUEST HTTP METHOD
            request.httpMethod = "GET"
            
            //REQUEST DATA HTTPBODY JSON
            // request.httpBody = reqData
            
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
                            self.parsdata1(res1: resDict as! [String : Any])
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
    
    
    
    func parsdata1(res1 : [String:Any])
    {
        
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            
            var obj = Likesmodal()
            obj.id =  (res["Nid"] as? String)!
            obj.idr = (res["Rid"] as? String)!
            obj.idc = (res["Cid"] as? String)!
            obj.des = (res["Description"] as? String)!
            obj.lat = (res["Latitude"] as? String)!
            obj.lon = (res["Longitude"] as? String)!
            obj.ar = (res["Area"] as? String)!
            obj.ci = (res["City"] as? String)!
            obj.im = (res["Image"] as? String)!
            obj.status = (res["Status"] as? String)!
            
            
            
      arrModal1.append(obj)
            
            
            
            
           
            
        }
        admintable.reloadData()
       
    }
    
    
    
   
    
    
    
   

}
