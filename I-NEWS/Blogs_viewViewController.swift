//
//  Blogs_viewViewController.swift
//  I-NEWS
//
//  Created by Prexa Patel on 04/01/19.
//  Copyright © 2019 Prexa Patel. All rights reserved.
//

import UIKit

class Blogs_viewViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    var bid = [String]()
    var rid = [String]()
    var cid = [String]()
    var des = [String]()
    var lati = [String]()
    var longi = [String]()
    var ar = [String]()
    var ci = [String]()
    var imgb = [String]()
    
    
    var a = [String]()
    var b = [String]()
    var c = [String]()
    
    
    
    
    var p = [String]()
    var q = [String]()
    var z = [String]()
    var w = [String]()
    
    
    @IBOutlet weak var blogtable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bid.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "blogsviewcell") as! BlogsviewTableViewCell
        cell.bloglbl.text = des[indexPath.row]
        let reqUrl = URL(string: consturl + imgb[indexPath.row])
        let data = NSData(contentsOf: reqUrl!)
        
        if data != nil
        {
            cell.blogimg.image =  UIImage(data:data as! Data)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 497
    }
    override func viewDidLoad() {
        super.viewDidLoad()
POST_Data()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func POST_Data() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "blogs_view.php")
        
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
                            self.parsdata(res2: resDict as! [String : Any])
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
    
    func parsdata(res2 : [String:Any])
    {
        
        var arr = res2["response"] as! [[String:Any]]
        for res in arr
        {
            var id = res["Blogid"] as? String
            bid.append(id!)
            print(bid)
            
            var idr = res["Rid"] as? String
            rid.append(idr!)
            print(rid)
            
            var idc = res["Cid"] as? String
            cid.append(idc!)
            print(cid)
            
            var d = res["Description"] as? String
            des.append(d!)
            print(des)
            
            
            var latitude = res["Latitude"] as? String
            lati.append(latitude!)
            print(lati)
            
            
            var longitude = res["Longitude"] as? String
            longi.append(latitude!)
            print(longi)
            
            var area = res["Area"] as? String
            ar.append(area!)
            print(ar)
            
            var city = res["City"] as? String
            ci.append(city!)
            print(ci)
            
            
            
            var image = res["Image"] as? String
            imgb.append(image!)
            
            print(imgb)
            
            
        }
         blogtable.reloadData()
        
    }
    
    @IBAction func likes(_ sender: Any) {
        
        POST_Datalikes()
    }
    
    
    
    func POST_Datalikes() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "likesblogs_view.php")
        
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
                            self.pars(res1: resDict as! [String : Any])
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
    
    
    
    func pars(res1 : [String:Any])
    {
        
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            var u = res["Lid"] as? String
            a.append(u!)
            print(a)
            
            var v = res["Rid"] as? String
            b.append(v!)
            print(b)
            
            var x = res["Blogid"] as? String
            c.append(x!)
            print(c)
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    @IBAction func comments(_ sender: Any) {
        
        POST_Datacomm()
    }
    
    
    
    func POST_Datacomm() -> Void
    {
        //Make ADDRESS URL
        let reqUrl = URL(string: url1 + "blogcomm_view.php")
        
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
                            self.pars1(res1: resDict as! [String : Any])
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
    
    
    
    func pars1(res1 : [String:Any])
    {
        
        var arr = res1["response"] as! [[String:Any]]
        for res in arr
        {
            var o = res["Commid"] as? String
            p.append(o!)
            print(p)
            
            var x = res["Rid"] as? String
            q.append(x!)
            print(q)
            
            var y = res["Blogid"] as? String
            z.append(y!)
            print(z)
            
            
            var m = res["comments"] as? String
            w.append(m!)
            print(w)
            
            
            
            
            
        }
        
    }
    
    
    
   
    
    
    
    
    
    
}
